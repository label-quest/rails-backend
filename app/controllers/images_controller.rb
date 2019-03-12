class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :update, :destroy]

  # GET /images
  def index
    @images = Image.all

    render json: @images
  end

  # GET /images/1
  def show
    render json: @image
  end

  # Get /training_sample
  def training_sample
    offset = rand(Image.count)
    random_image = Image.offset(offset).first

    json_resp = {
        labels: [],
        id: random_image.id,
        imageSrc: random_image.file_path
    }

    random_image.dataset.dataset_classes.each do |dataset_class|
      dataset_class_obj = {
          name: dataset_class.name,
          id: dataset_class.id
      }

      json_resp[:labels].push(dataset_class_obj)
    end

    render json: json_resp
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:file_path, :dataset_id)
    end
end
