class Reductions::Unions
  def self.pivot(pivot,options)
    imp_options = options.clone
    conv_options = options.clone
    imps = Reductions::ImpressionsByHour.pivot(pivot,imp_options)
    conversions = Reductions::ConversionsByHour.pivot(pivot,conv_options)
    merge(imps,conversions)
  end

  def self.aggregate(pivot,options)
    imp_options = options.clone
    conv_options = options.clone
    imps = Reductions::ImpressionsByHour.aggregate(pivot,imp_options)
    conversions = Reductions::ConversionsByHour.aggregate(pivot,conv_options)
    merge(imps,conversions)
  end

  def self.merge(this_collection,that_collection)
    return nil if this_collection.nil? && that_collection.nil?
    return this_collection if that_collection.nil?
    return that_collection if this_collection.nil?
    this_collection.deep_merge(that_collection)
  end

end