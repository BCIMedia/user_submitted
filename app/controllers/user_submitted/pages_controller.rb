module UserSubmitted
  class PagesController < ApplicationController
    before_action :set_content, only: [:new, :create]

    def home
      @collections = UserSubmitted::Collection.includes(:contents).all
    end

    # def index
    #   binding.pry

    # end

    # def show
    #   binding.pry
    # end

    def new
      @content = Content.new(collection: @collection)
    end

    def create
      @content = Content.new(basic_content_params)
      if @content.save
        redirect_to user_submitted_new_content_path, notice: 'Thank you, your image/video was successfully uploaded. We will review your submission.'
      else
        render :new
      end
    end

    private
    def set_content
      @collection = Collection.find(params[:id])
    end

    def basic_content_params
      params.require(:user_submitted_content).permit(:caption, :credit, :data, :email, :collection_id)
    end
  end
end
