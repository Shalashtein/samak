class PagesController < ApplicationController
  before_action :current_cart, only: [:market]
  layout 'account', only: [:account]

  def current_cart
    if session[:cart_id] && !Cart.find(session[:cart_id]).nil?
      @current_cart ||= Cart.find(session[:cart_id])
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create(user_id: current_user.id)
      @current_cart.save!
      session[:cart_id] = @current_cart.id
    end
    @cart_total = 0
    @current_cart.items.each do |i|
      @cart_total += i.product.price * i.product.catch.weight
    end
    @current_cart
  end

  def market
    @active_products = Product.where(bought: false)
  end

  def bucket
    @product = Product.new
    @catches = if current_user.admin?
                 Catch.all
               else
                  Catch.where(user_id: current_user.id).select {|c| Product.where(catch_id: c.id).first.nil? }
               end
    @active_products = Product.where(user_id: current_user.id).select {|p| Order.where(product_id: p.id).first.nil? || !Order.where(product_id: p.id).first.picked? }
    @fish = Fish.all.select {|f| !f.image.file.nil?}
    @catch = Catch.new
  end

  def account; end
end
