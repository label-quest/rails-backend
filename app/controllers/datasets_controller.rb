class DatasetsController < ApplicationController
  before_action :set_dataset, only: [:show, :update, :destroy, :label_stats, :progress]

  # GET /datasets
  def index
    @datasets = Dataset.all

    render json: @datasets.to_json(:include => :dataset_classes)
  end

  # GET /datasets/1
  def show
    render json: @dataset.to_json(:include => :dataset_classes)
  end

  #GET /datasets/1/progress
  def progress
    relative_progress = ((@dataset.labels.count / @dataset.goal) * 100).round(2)
    if relative_progress > 100.00
      relative_progress = 100.00
    end

    json_resp = {
        progress: relative_progress
    }

    render json: json_resp
  end

  #GET /datasets/1/label_stats
  def label_stats
    chart_json = []
    colors = ["hsl(237, 70%, 50%)", "hsl(235, 70%, 50%)", "hsl(22, 70%, 50%)", "hsl(129, 70%, 50%)", "hsl(89, 70%, 50%)"]

    @dataset.dataset_classes.each_with_index do | dataset_class, index |
      slice_obj = {
          id: dataset_class.name,
          label: dataset_class.name,
          value: dataset_class.labels.count,
          color: colors[index]
      }
      chart_json.push(slice_obj)
    end

    render json: chart_json
  end

  # POST /datasets
  def create
    @dataset = Dataset.new(dataset_params)

    if @dataset.save
      render json: @dataset, status: :created, location: @dataset
    else
      render json: @dataset.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /datasets/1
  def update
    if @dataset.update(dataset_params)
      render json: @dataset
    else
      render json: @dataset.errors, status: :unprocessable_entity
    end
  end

  # DELETE /datasets/1
  def destroy
    @dataset.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset
      @dataset = Dataset.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dataset_params
      params.require(:dataset).permit(:name, :description, :goal, :folder_path, :customer_id)
    end
end
