class CartsController < ApplicationController
  before_action :set_cart, only: %i[show edit update destroy add]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    authorize @carts, policy_class: CartPolicy
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @location = Location.new
    authorize @cart, policy_class: CartPolicy
  end

  def add_to_cart
    @current_cart.add_item(params[:product_id])
  end

  # GET /carts/new
  def new
    @cart = Cart.new
    authorize @cart, policy_class: CartPolicy
  end

  # GET /carts/1/edit
  def edit
    authorize @cart, policy_class: CartPolicy
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    authorize @cart, policy_class: CartPolicy
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    authorize @cart, policy_class: CartPolicy
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    authorize @cart, policy_class: CartPolicy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(:user_id, :products_id)
  end
end
