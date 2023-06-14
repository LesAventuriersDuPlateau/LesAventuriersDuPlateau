class CartsController < ApplicationController
  
  include CartsHelper 
  before_action :require_login
  before_action :only_current_cart
  
  def show
    @events_in_cart = Order.where(cart_id:current_user.cart.id)
  end

  def create
  end

  def update
  end

  def destroy
  end
end
