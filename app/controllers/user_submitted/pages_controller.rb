module UserSubmitted
  class PagesController < ApplicationController
    before_action :set_collection, only: [:new, :create, :update]

    def home
      @collections = UserSubmitted::Collection.includes(:contents).all
    end

    def index
      @collection = UserSubmitted::Collection.includes(:contents).find(params[:id])
    end

    def group
      @collections = UserSubmitted::Collection.includes(:contents).where(identifier: params[:id])
    end

    # def show; end

    def new
      @content = Content.new(collection: @collection)
    end

    def create
      @content = Content.new(basic_content_params)
      if @content.save(validate: false)
        render json: { success: true, id: @content.id, notice: "Thank you, your image/video was successfully uploaded. We will review your submission." }
      else
        render json: { success: false, notice: "Could not save file" }, status: 500
      end
    end

    def update
      @content = Content.find(params[:content_id])
      if @content
        @content.update(
          caption: params[:caption],
          credit:  params[:credit],
          status:  Content.statuses[:pending]
        )
        render json: { success: true, id: @content.id, notice: "Thank you, your content was successfully uploaded."}
      else
        render json: { success: false, notice: "Could not update attributes" }
      end
    end

    private
    def set_collection
      @collection = Collection.find(params[:id])
    end

    def basic_content_params
      params.require(:user_submitted_content).permit(:caption, :credit, :data, :email, :collection_id)
    end
  end
end
