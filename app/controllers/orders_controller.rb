class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  # GET /orders
  # GET /orders.json
  def index
    if current_user.admin?
      @orders = Order.all
    else
      @orders = Order.where(user_id: current_user.id)
    end
    authorize @orders, policy_class: OrderPolicy
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    authorize @order, policy_class: OrderPolicy
  end

  # GET /orders/new
  def new
    @order = Order.new
    authorize @order, policy_class: OrderPolicy
  end

  # GET /orders/1/edit
  def edit
    authorize @order, policy_class: OrderPolicy
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    authorize @order, policy_class: OrderPolicy
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def multiple
    c = Cart.find(order_params[:cart])
    c.items.each do |i|
      o = Order.new(user_id: order_params[:user_id], product_id: i.product.id,
                    location_id: Location.where(user_id: current_user.id).first.id,
                    done: false)
      o.save!
      i.destroy
    end
    redirect_to orders_path, success: "All items have been ordered."
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    authorize @order, policy_class: OrderPolicy
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    authorize @order, policy_class: OrderPolicy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id, :product_id, :location_id, :done, :cart)
  end
end
