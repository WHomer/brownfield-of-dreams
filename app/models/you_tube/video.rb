# frozen_string_literal: true

# Youtube module
module YouTube
  # Video poro
  class Video
    attr_reader :thumbnail

    def initialize(data = {})
      @thumbnail = data[:items].first[:snippet][:thumbnails][:high][:url]
    end

    def self.by_id(id)
      new(YoutubeService.new.video_info(id))
    end
  end
end
