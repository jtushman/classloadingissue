class Reductions::Base

  def self.collection
    @@collection ||= Mongoid.database.collection collection_name
  end

  def self.collection_initialized?
    Mongoid.master.collections.map(&:name).include? collection_name
  end


  def self.pivot(pivot, options={})
    perform_reduction unless collection_initialized?

    options['out'] = {inline: 1}
    options[:raw] = true
    options[:query] ||= {}
    options[:finalize] = finalize if respond_to?(:finalize)

    pivot_table_query = {}
    options[:query].each do |key, value|
      if key == :created_at
        rounded_time_query = {}
        rounded_time_query['$gte'] = value['$gte'].change(min: 0)
        rounded_time_query['$lte'] = value['$lte'].change(min: 0)
        pivot_table_query["_id.hour"] = rounded_time_query
      else
        pivot_table_query["_id.#{key}"] = value
      end
    end

    options[:query] = pivot_table_query
    reduced_hash = collection.map_reduce(map_for(pivot), reduce, options)
    convert_to_hash reduced_hash['results']
  end

  def self.aggregate(pivot, options={})
    reduced_hash = pivot(pivot, options)
    raise 'excepted one row' if reduced_hash.count > 1
    if reduced_hash.count == 1
      reduced_hash.values.first
    else
      nil
    end
  end

  def self.map_for(pivot)
    raise "UnknownPivot #{pivot}" unless %w{account_id ad_id ad_option_id campaign_id companion_id video_id}.include?(pivot.to_s)
    <<-EOS
      function() {
        emit(this._id.#{pivot.to_s},this.value)
      }
    EOS
  end

  def self.merge(this_collection, that_collection)
    return nil if this_collection.nil? && that_collection.nil?
    return this_collection if that_collection.nil?
    return that_collection if this_collection.nil?
    this_collection.deep_merge(that_collection)
  end

  def read_pivot(pivot,query,selector)
    
  end

  private

  def self.convert_to_hash(results)
    h = {}
    results.each do |result_row|
      h[result_row['_id']] = result_row['value']
    end
    h
  end

end