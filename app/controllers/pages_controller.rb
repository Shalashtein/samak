class PagesController < ApplicationController
  before_action :current_cart, only: [:market]
  layout 'market'

  def current_cart
    @current_cart ||= Cart.find(session[:cart_id]) if session[:cart_id] && !Cart.find(session[:cart_id]).nil?
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
    @products = Product.all
  end

  def bucket; end
end
