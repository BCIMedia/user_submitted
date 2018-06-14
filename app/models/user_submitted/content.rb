module UserSubmitted
  class Content < ActiveRecord::Base
    self.table_name = "user_submitted_contents"

    validates_presence_of :credit


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
    validates_attachment :data, presence: true,
      message:      "You must select an image to upload."

    enum status: { pending: 0, rejected: -1, approved: 1 }

    scope :images, -> { where("data_content_type LIKE ?", "%image%") }
    scope :videos, -> { where("data_content_type LIKE ?", "%video%") }
    scope :images, -> { where(status: :approved) }

    def get_color
      case status
      when "rejected"
        "red"
      when "approved"
        "green"
      when "pending"
        "hotpink"
      end
    end

    def get_icon
      case status
      when "rejected"
        "<i class='fa fa-exclamation' aria-hidden='true'></i>".html_safe
      when "approved"
        "<i class='fa fa-check' aria-hidden='true'></i>".html_safe
      when "pending"
        "<i class='fa fa-clock-o' aria-hidden='true'></i>".html_safe
      end
    end

    private

    def is_video?
      data.instance.data_content_type =~ %r(video)
    end

    def is_image?
      data.instance.data_content_type =~ %r(image)
    end

  end
end
