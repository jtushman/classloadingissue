class Reductions::ConversionsByHour #< Reductions::Base

  def self.hello
    "hello"
  end

  #def self.collection_name
  #  @@collection_name ||= 'conversions_by_hour'
  #end
  #
  #def self.reduce
  #  @@reduce ||= <<-EOS
  #    function(key,values) {
  #      var direct_conversions = 0;
  #      var view_through_conversions = 0;
  #
  #      values.forEach(function(doc){
  #         direct_conversions += doc.direct_conversions;
  #         view_through_conversions += doc.view_through_conversions;
  #      });
  #      return {
  #               direct_conversions: direct_conversions,
  #               view_through_conversions: view_through_conversions
  #             };
  #    };
  #  EOS
  #end
  #
  #
  #def self.map
  #  @@map ||= <<-EOS
  #  function() {
  #
  #     var hour = new Date(this.created_at)
  #     hour.setMinutes(0,0,0);
  #
  #     key = {};
  #     key['account_id'] = this.account_id;
  #     key['ad_id'] = this.ad_id;
  #     key['ad_option_id'] = this.ad_option_id
  #     key['campaign_id'] = this.campaign_id;
  #     key['companion_id'] = this.companion_id;
  #     key['hour'] = hour;
  #     key['video_id'] = this.video_id
  #
  #     doc = {};
  #     doc['direct_conversions'] = this.first_conversion ? 1 : 0;
  #     doc['view_through_conversions'] = 1
  #
  #     emit(key,doc);
  #  }
  #  EOS
  #end
  #
  #def self.perform_reduction
  #  Pipeline::Benchmarker.benchmark("Full M/R Conversions by Hour") do
  #    Conversion.collection.map_reduce(map, reduce, {out: {replace: collection_name}})
  #  end
  #end
  #
  #def self.collection
  #  @collection ||= Mongoid.database.collection collection_name
  #end

end