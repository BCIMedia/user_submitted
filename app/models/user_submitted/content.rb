module UserSubmitted
  class Content < ActiveRecord::Base
    include InvalidatesCache
    self.table_name = "user_submitted_contents"

    validates_presence_of :credit

    belongs_to :collection

    if Rails.env == "development"
      has_attached_file :data
    else
      has_attached_file :data,
        path: "/#{UserSubmitted.configuration.s3_directory}/:class/:id/:attachment/:style/:id_:filename",
        source_file_options: { all: "-auto-orient" },
        styles: { original: "", thumb: "200x200#" }
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

    enum status: { temp: 0, pending: 1, rejected: -1, approved: 2 }

    scope :images, -> { where("data_content_type LIKE ?", "%image%") }
    scope :videos, -> { where("data_content_type LIKE ?", "%video%") }
    scope :approved_videos, -> { images.where(status: :approved) }
    scope :approved_images, -> { videos.where(status: :approved) }

    def content_rejected

    end

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
        "<i class='fas fa-exclamation' aria-hidden='true'></i>".html_safe
      when "approved"
        "<i class='fas fa-check' aria-hidden='true'></i>".html_safe
      when "pending"
        "<i class='far fa-clock' aria-hidden='true'></i>".html_safe
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
