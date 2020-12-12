class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  layout 'market', only: %i[fisherman]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @active_products = Product.where(bought: false)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def fisherman
    @active_products = Product.where(user_id: current_user.id, bought: false)
    @products = Product.where(user_id: current_user.id, bought: true).select {|p| !Order.where(product_id: p.id).first.done?}
    @history = Product.where(user_id: current_user.id, bought: true).select {|p| Order.where(product_id: p.id).first.done?}

  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product, policy_class: ProductPolicy
  end

  # GET /products/1/edit
  def edit
    authorize @product, policy_class: ProductPolicy
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    if @product.user_id.nil?
      @product.user_id = current_user.id
    end
    authorize @product, policy_class: ProductPolicy
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    authorize @product, policy_class: ProductPolicy
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    authorize @product, policy_class: ProductPolicy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:catch_id, :price, :user_id, :bought)
  end
end
