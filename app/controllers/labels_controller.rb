require 'faraday'

class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :update, :destroy]

  # GET /labels
  def index
    @labels = Label.all

    render json: @labels
  end

  # GET /labels/1
  def show
    render json: @label
  end

  # POST /label_placement
  def label_placement
    saved = false

    if !params[:user_id].blank? and !params[:image_id].blank?
      if User.find_by(id: params[:user_id]) and Image.find_by(id: params[:image_id])
        user = User.find_by(id: params[:user_id])
        image = Image.find_by(id: params[:image_id])
        saved = true
        params[:labels].each do |label_obj|
          dataset_class = DatasetClass.find_by(id: label_obj[:label_id])
          Label.create(user: user, image: image, dataset_class: dataset_class, x_pos: label_obj[:x], y_pos: label_obj[:y])
        end
      end
    end

    render json: {ok: saved}
  end

  # POST /labels
  def create
    @label = Label.new(label_params)

    if @label.save
      if @label.dataset.labels.count > 10 and @label.dataset.labels.count % 10 == 0
        json_body = {
          dataset: @label.dataset.id,
          data: []
        }

        @label.dataset.images.each do |image|
          if image.labels.count > 0
            train_sample = {
              file_path: image.file_path,
              label: image.majority_class.name
            }
            json_body[:data].push(train_sample)
          end
        end

        byebug

        conn = Faraday.new(url: 'http://localhost:5000')

        conn.post do |req|
          req.url '/train'
          req.headers['Content-Type'] = 'application/json'
          req.body = json_body.to_json
        end
      end

      render json: @label, status: :created, location: @label
    else
      render json: @label.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /labels/1
  def update
    if @label.update(label_params)
      render json: @label
    else
      render json: @label.errors, status: :unprocessable_entity
    end
  end

  # DELETE /labels/1
  def destroy
    @label.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def label_params
      params.require(:label).permit(:x_pos, :y_pos, :user_id, :dataset_class_id, :image_id, :labels)
    end
end
