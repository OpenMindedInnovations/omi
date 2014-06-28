module BlogsHelper

  def youtube_video(youtube_id)
    content_tag :iframe, height: '600', width: '100%', src: "//www.youtube.com/embed/" + youtube_id, frameborder: '0', allowfullscreen: true
  end
end
