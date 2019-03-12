class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy, :overall_stats]

  # GET /customers
  def index
    @customers = Customer.all

    render json: @customers.to_json(:include => {:datasets => {:include => :dataset_classes}})
  end

  # GET /customers/1
  def show
    render json: @customer.to_json(:include => {:datasets => {:include => :dataset_classes}})
  end

  #GET /customers/1/overall_stats
  def overall_stats
    json_resp = []
    colors = ["hsl(290, 70%, 50%)", "hsl(105, 70%, 50%)", "hsl(85, 70%, 50%)", "hsl(151, 70%, 50%)", "hsl(300, 70%, 50%)"]

    @customer.datasets.each_with_index do |dataset, index|
      data_obj = []

      (Date.today - 6..Date.today).map do |day|
        single_obj = {
            x: day.iso8601,
            y: Dataset.labels_at(day, dataset.id)
        }
        data_obj.push(single_obj)
      end

      dataset_obj = {
        id: dataset.name,
        color: colors[index],
        data: data_obj
      }

      json_resp.push(dataset_obj)
    end

    render json: json_resp
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  #POST /customer_authenticate
  def authenticate
    authenticated = false

    json_resp = {
        ok: authenticated
    }
    
    if !params[:username].blank? and !params[:password].blank?
      if Customer.find_by(name: params[:username])
        customer = Customer.find_by(name: params[:username])
        if customer.password == params[:password]
          authenticated = true
          json_resp = {
              id: customer.id,
              username: params[:username],
              firstName: customer.name,
              lastName: customer.name,
              ok: authenticated,
              token: "fake-jwt-token"
          }
        end
      end
    end

    render json: json_resp

  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(:name, :password, :username)
    end
end
