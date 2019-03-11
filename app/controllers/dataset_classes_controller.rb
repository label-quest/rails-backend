class DatasetClassesController < ApplicationController
  before_action :set_dataset_class, only: [:show, :update, :destroy]

  # GET /dataset_classes
  def index
    @dataset_classes = DatasetClass.all

    render json: @dataset_classes
  end

  # GET /dataset_classes/1
  def show
    render json: @dataset_class
  end

  # POST /dataset_classes
  def create
    @dataset_class = DatasetClass.new(dataset_class_params)

    if @dataset_class.save
      render json: @dataset_class, status: :created, location: @dataset_class
    else
      render json: @dataset_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dataset_classes/1
  def update
    if @dataset_class.update(dataset_class_params)
      render json: @dataset_class
    else
      render json: @dataset_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dataset_classes/1
  def destroy
    @dataset_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_class
      @dataset_class = DatasetClass.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dataset_class_params
      params.require(:dataset_class).permit(:name, :description, :dataset_id)
    end
end
