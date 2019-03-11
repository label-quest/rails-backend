class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.all

    render json: @customers.to_json(:include => :datasets)
  end

  # GET /customers/1
  def show
    render json: @customer.to_json(:include => :datasets)
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

    json_resp = {
        ok: authenticated
    }

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
