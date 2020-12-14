# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    layout 'user'
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    def destroy
      unless session[:cart_id].nil?
        @current_cart ||= Cart.find(session[:cart_id])
        if @current_cart.items.first.nil?
          puts @current_cart
          puts "oooooooooooooooooooooooooooo"
          @current_cart.destroy          byebug
        end
      end
      super
    end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
