class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      #attaches current order to newly created user
      current_order.update(user_id:@user.id)
      redirect_to root_path, notice: "You are now a hippo!"
    else
      render :new, notice: "There was a problem saving this user! :("
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @products = @user.products
    @orders = @user.orders
    # @stati = @order.order_products.map {|op| op.status}
    #   unless (@stati.include? "pending") || (@stati.include? "paid")
    #     @order.update(status:"complete")
    #   end
    @quantityarray = @products.map do |product|
      product.order_products.map do |item|
        item.quantity
      end
    end
    @totals = @quantityarray.map do |qa|
      qa.inject(:+) 
    end
  end

  def search
    @users = User.where name: params[:name]
    render :index
  end

  def orders
    if params[:id].to_i != session[:user_id].to_i
      flash[:notice] = "You are not authorized to view this page!"
      redirect_to user_path(params[:id])
    else
      @user = User.find(params[:id])
      @products = @user.products
      @paid = @products.map do |product|
        product.order_products.where(status:"paid")
      end
    end
  end

  def pending
    if params[:id].to_i != session[:user_id].to_i
      flash[:notice] = "You are not authorized to view this page!"
      redirect_to user_path(params[:id])
    else
      @user = User.find(params[:id])
      @products = @user.products
      @pending = @products.map do |product|
        product.order_products.where(status:"pending")
      end
    end
  end

  def completed
    if params[:id].to_i != session[:user_id].to_i
      flash[:notice] = "You are not authorized to view this page!"
      redirect_to user_path(params[:id])
    else
      @user = User.find(params[:id])
      @products = @user.products
      @completed = @products.map do |product|
        product.order_products.where(status:"shipped")
      end
    end
  end

  def ship
    @op = OrderProduct.find(params[:op_id])
    @op.update(status: "shipped")
    redirect_to user_orders_path(session[:user_id], Order.find(@op.order_id))
    #update order to shipped
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end