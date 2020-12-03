class PagesController < ApplicationController
  #before_action :current_cart, only: [ :market ]

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

  def market
    @products = Product.all
  end
end
