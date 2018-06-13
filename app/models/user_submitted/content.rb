module UserSubmitted
  class Content < ActiveRecord::Base
    self.table_name = "user_submitted_contents"

    belongs_to :collection

    if Rails.env == "development"
      has_attached_file :data
    else
      has_attached_file :data, path: "/#{UserSubmitted.configuration.s3_directory}/:class/:id/:attachment/:id_:filename"
    end

    # validates_attachment :data,
    #   content_type: { content_type: 'video/mp4' },
    #   message:      "Sorry, right now we only support MP4 video",
    #   if:           :is_video?

    validates_attachment :data,
      content_type: { content_type: ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'] },
      message:      "Sorry, this image format is not supported.",
      if:           :is_image?

    enum status: { pending: 0, rejected: -1, approved: 1 }

    private

    def is_video?
      data.instance.data_content_type =~ %r(video)
    end

    def is_image?
      data.instance.data_content_type =~ %r(image)
    end

  end
end
