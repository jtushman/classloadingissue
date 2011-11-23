class Reductions::ImpressionsByHour #< Reductions::Base

  def self.hello
    "hello"
  end

  #def self.collection_name
  #  @@collection_name ||= 'impressions_by_hour'
  #end
  #
  #def self.map
  #  @@map ||= <<-EOS
  #    function() {
  #
  #       var hour = new Date(this.created_at)
  #       hour.setMinutes(0,0,0);
  #
  #       key = {};
  #       key['account_id'] = this.account_id;
  #       key['ad_id'] = this.ad_id;
  #       key['ad_option_id'] = this.ad_option_id
  #       key['campaign_id'] = this.campaign_id;
  #       key['companion_id'] = this.companion_id;
  #       key['hour'] = hour;
  #       key['video_id'] = this.video_id
  #
  #       doc = {};
  #       doc['clicks'] = (this.companion_clicked || this.video_clicked) ? 1 : 0;
  #       doc['companion_clicks'] = this.companion_clicked ? 1 : 0;
  #       doc['impressions'] = 1;
  #       doc['total_view_through'] = this.viewthrough_percentage;
  #       doc['video_clicks'] = this.video_clicked ? 1 : 0;
  #
  #      emit(key,doc)
  #    }
  #  EOS
  #end
  #
  #def self.reduce
  #  @@reduce ||= <<-EOS
  #    function(key,values) {
  #
  #      var clicks = 0;
  #      var companion_clicks = 0;
  #      var impressions = 0;
  #      var total_view_through = 0;
  #      var video_clicks = 0;
  #
  #      values.forEach(function(doc){
  #         clicks += doc.clicks;
  #         companion_clicks += doc.companion_clicks;
  #         impressions += doc.impressions;
  #         total_view_through += doc.total_view_through;
  #         video_clicks += doc.video_clicks;
  #      });
  #      return {
  #               clicks: clicks,
  #               companion_clicks: companion_clicks,
  #               impressions: impressions,
  #               total_view_through: total_view_through,
  #               video_clicks: video_clicks
  #             };
  #    }
  #  EOS
  #
  #end
  #
  #def self.finalize
  #  @@finalize ||= <<-EOS
  #     function(key,value) {
  #       value.ctr = value.impressions ? value.clicks / value.impressions : 0 ;
  #       value.average_view_through = value.impressions ? value.total_view_through / value.impressions : 0;
  #       return value;
  #     }
  #  EOS
  #end
  #
  #def self.perform_reduction
  #  Pipeline::Benchmarker.benchmark("Incremental M/R Impressions by Hour") do
  #    Impression.collection.map_reduce(map, reduce, {query: {reduced: false}, out: {reduce: collection_name}})
  #    Impression.update_all(reduced: true)
  #  end
  #end

end