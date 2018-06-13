module UserSubmitted
  class ContentsController < ::AdminController
    before_action :set_content, only: [:show, :edit, :update, :destroy]
    before_action :set_collection, only: [:index, :new, :edit]

    # GET /contents
    def index
      if @collection
        @contents = Content.where(collection: @collection)
      else
        @contents = Content.all
      end
    end

    # GET /contents/1
    def show
    end

    # GET /contents/new
    def new
      @content = Content.new(collection: @collection)
    end

    # GET /contents/1/edit
    def edit
    end

    # POST /contents
    def create
      @content = Content.new(content_params)

      if @content.save
        redirect_to user_submitted_collection_content_path(@content.collection, @content), notice: 'Content was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /contents/1
    def update
      if @content.update(content_params)
        redirect_to user_submitted_collection_content_path(@content.collection, @content), notice: 'Content was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /contents/1
    def destroy
      collection = @content.collection
      @content.destroy
      redirect_to user_submitted_collection_path(collection), notice: 'Content was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_content
        @content = Content.find(params[:id])
      end

      def set_collection
        @collection = Collection.find(params[:collection_id]) if params[:collection_id].to_i > 0
      end

      # Only allow a trusted parameter "white list" through.
      def content_params
        params.require(:user_submitted_content).permit(:caption, :credit, :data, :email, :note, :status, :collection_id)
      end
  end
end
