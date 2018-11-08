module UserSubmitted
  class CollectionsController < ::AdminController
    before_action :set_collection, only: [:show, :edit, :update, :destroy]

    # GET /collections
    def index
      @collections = Collection.all
    end

    # GET /collections/1
    def show
      @collections = Collection.approved_contents
    end

    # GET /collections/new
    def new
      @collection = Collection.new
    end

    # GET /collections/1/edit
    def edit
    end

    # POST /collections
    def create
      @collection = Collection.new(collection_params)

      if @collection.save
        redirect_to user_submitted_collection_path(@collection), notice: 'Collection was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /collections/1
    def update
      if @collection.update(collection_params)
        redirect_to user_submitted_collection_path(@collection), notice: 'Collection was successfully updated.'
      else
        render :index
      end
    end

    # DELETE /collections/1
    def destroy
      @collection.destroy
      redirect_to collections_url, notice: 'Collection was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_collection
        @collection = Collection.find(params[:id])
        @status     = params[:status]
      end

      # Only allow a trusted parameter "white list" through.
      def collection_params
        params.require(:user_submitted_collection).permit(:name, :description, :identifier)
      end
  end
end
