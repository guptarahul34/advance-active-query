class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @customers = Customer.includes(:orders)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @products = Product.all
    @customers = Customer.all
  end

  def create
   @order = Order.new(order_params)
   if @order.save
    
    redirect_to orders_path
   else
    render :new, status: :unprocessable_entity
   end
       
  end

  def edit
    @order = Order.find(params[:id])
    @products = Product.all
    @customers = Customer.all
  end

  def update
    @order = Order.find(params[:id])
      if @order.update(order_params)
        redirect_to orders_path
      else
        render :edit, status: :unprocessable_entity
      end
   end

   def destroy
    @order = Order.find(params[:id])
   
    @order.destroy

    redirect_to orders_path
  end

  def search_by_name
   product = Product.find_by(title:params[:search_by_name])
   if !product.nil?
    order_by_product_id =  Order.where(product_id:product.id)
    redirect_to orders_path(order:order_by_product_id)
   end
    
  end

  private
     def order_params
         params.require(:order).permit(:quantity,:total_price,:customer_id,:product_id,:status)
     end

end
