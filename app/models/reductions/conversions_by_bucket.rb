# Maddening http://www.williambharding.com/blog/technology/rails-3-autoload-modules-and-classes-in-production/
# In console  require 'reductions/conversions_by_bucket.rb'
class Reductions::ConversionsByBucket

  def self.hello
    "hello"
  end

  #def self.map
  #  @@map ||= <<-EOS
  #      function() {
  #
  #        key = this.ad_option_id
  #
  #        doc = {};
  #        doc['one_per_click'] = {};
  #        doc['one_per_click']['one_day'] = 0;
  #        doc['one_per_click']['thirty_day'] = 0;
  #        doc['one_per_click']['one_year'] = 0;
  #        doc['one_per_click']['more_than_year'] = 0;
  #        doc['many_per_click'] = {};
  #        doc['many_per_click']['one_day'] = 0;
  #        doc['many_per_click']['thirty_day'] = 0;
  #        doc['many_per_click']['one_year'] = 0;
  #        doc['many_per_click']['more_than_year'] = 0;
  #
  #        var d = this.seconds_since_impression
  #        if (d < 86400) {
  #          doc['one_per_click']['one_day'] = this.first_conversion ? 1 : 0;
  #          doc['many_per_click']['one_day'] = 1
  #        } else if (d < 2592000) {
  #          doc['one_per_click']['thirty_day'] = this.first_conversion ? 1 : 0;
  #          doc['many_per_click']['thirty_day'] = 1
  #        } else if (d < 31536000) {
  #          doc['one_per_click']['one_year'] = this.first_conversion ? 1 : 0;
  #          doc['many_per_click']['one_year'] = 1
  #        } else if (d >= 31536000) {
  #          doc['one_per_click']['more_than_year'] = this.first_conversion ? 1 : 0;
  #          doc['many_per_click']['more_than_year'] = 1
  #        }
  #
  #        emit(key,doc);
  #      };
  #  EOS
  #end
  #
  #def self.reduce
  #  @@reduce ||= <<-EOS
  #      function(key,values) {
  #        memo = {};
  #        memo['one_per_click'] = {};
  #        memo['one_per_click']['one_day'] = 0;
  #        memo['one_per_click']['thirty_day'] = 0;
  #        memo['one_per_click']['one_year'] = 0;
  #        memo['one_per_click']['more_than_year'] = 0;
  #        memo['many_per_click'] = {};
  #        memo['many_per_click']['one_day'] = 0;
  #        memo['many_per_click']['thirty_day'] = 0;
  #        memo['many_per_click']['one_year'] = 0;
  #        memo['many_per_click']['more_than_year'] = 0;
  #
  #        values.forEach(function(doc){
  #
  #        memo['one_per_click']['one_day'] += doc['one_per_click']['one_day']
  #        memo['one_per_click']['thirty_day'] += doc['one_per_click']['thirty_day']
  #        memo['one_per_click']['one_year'] += doc['one_per_click']['one_year']
  #        memo['one_per_click']['more_than_year'] += doc['one_per_click']['more_than_year']
  #        memo['many_per_click']['one_day'] += doc['one_per_click']['one_day']
  #        memo['many_per_click']['thirty_day'] += doc['one_per_click']['thirty_day']
  #        memo['many_per_click']['one_year'] += doc['one_per_click']['one_year']
  #        memo['many_per_click']['more_than_year'] += doc['one_per_click']['more_than_year']
  #        });
  #
  #        return memo;
  #      };
  #  EOS
  #end
  #
  #def self.pivot(pivot, options={})
  #  raise 'Currently only :ad_option_id is supported' unless pivot == :ad_option_id
  #  options['out'] = {inline: 1}
  #  options[:raw] = true
  #  options[:query] ||= {}
  #
  #  pivot_table_query = {}
  #  options[:query].each do |key, value|
  #    if key == :created_at
  #      rounded_time_query = {}
  #      rounded_time_query['$gte'] = value['$gte'].change(min: 0)
  #      rounded_time_query['$lte'] = value['$lte'].change(min: 0)
  #      pivot_table_query["created_at"] = rounded_time_query
  #    else
  #      pivot_table_query["#{key}"] = value
  #    end
  #  end
  #
  #  options[:query] = pivot_table_query
  #  reduced_hash = Conversion.collection.map_reduce(map, reduce, options)
  #  Reductions::Base.convert_to_hash reduced_hash['results']
  #end

end


