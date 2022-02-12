class ProductsController < ApplicationController
  def index
    @products = Product.all
    @customers = Order.select("customer_id, sum(quantity) as total_sum").group(:customer_id).order(total_sum: :desc).first(3)
    @customer_by_price = Order.select("customer_id, sum(total_price) as total_sum_price").group(:customer_id).order(total_sum_price: :desc).first(3)
    @customer_five = Order.select("customer_id, status, count(customer_id) as customer_group").group(:customer_id).where(status:'booked').order(customer_group: :desc).first(5)
    @customer_cancelled = Order.select("customer_id, status, count(customer_id) as customer_group").group(:customer_id).where(status:'cancelled').order(customer_group: :desc).first(5)
  end

  def show
    @product = Product.find(params[:id])
   @orders_id = Order.includes(:product).where(product_id:params[:id])
   
   
   
  end

  def new
    # @product = Product.where("is_active = ?",false).new
    @product = Product.new
  end

  def create
      @product = Product.new(product_params)
      if @product.save
         redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
  end

   def edit
      @product = Product.find(params[:id])
   end

   def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to root_path
      else
        render :edit, status: :unprocessable_entity
      end
   end

  def destroy
    @product = Product.find(params[:id])
   
    @product.destroy

    redirect_to root_path
  end

  def not_default
       @notdefault = Product.rewhere(is_active: false)
  end

  def all_scope_data
    @all_scope_data = Product.unscoped
  end

  # def quantity_product

  # end

  private
     def product_params
        params.require(:product).permit(:title,:description,:price,:capacity,:is_active,:status)
     end

  
end
