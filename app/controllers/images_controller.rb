require 'faraday'
require 'json'

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
        image: {
          id: random_image.id,
          imageSrc: random_image.file_path
        }
    }

    conn = Faraday.new(url: 'http://localhost:5000')

    response = conn.get 'http://localhost:5000/classify?file_path=' + random_image.file_path + '&dataset=' + random_image.dataset.name

    suggested_labels = JSON.parse(response.body).values[0]

    if suggested_labels.count > 5
      suggested_labels = suggested_labels[0..4]
    end

    suggested_labels.each do |suggested_label|
      next unless DatasetClass.find_by(name: suggested_label)

      dataset_class = DatasetClass.find_by(name: suggested_label)

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
