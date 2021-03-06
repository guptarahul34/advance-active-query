class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    # @products = Product.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
      if@customer.update(customer_params)
        redirect_to customers_path
      else
        render :edit, status: :unprocessable_entity
      end
   end

  def new
    @customer = Customer.new
  end

  def create
        @customer = Customer.new(customer_params)
        if @customer.save
          redirect_to customers_path
        else
          render :new, status: :unprocessable_entity
        end
  end

  def destroy
    @destroy = Customer.find(params[:id])
    @destroy.destroy
    redirect_to customers_path
  end

  private
   def customer_params
        params.require(:customer).permit(:fname,:lname,:email,:phone)
   end
end
