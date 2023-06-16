class OrdersController < ApplicationController
  def create
    @event_add = Order.add_or_create_cart_event_link(permit_link_params)
    redirect_to events_path
  end

  def update
  end

  def destroy
    @event_delete = Order.find(params[:id])
    @event_delete.destroy
    redirect_to cart_path
  end

  private

  def permit_link_params
    params.require(:order).permit(:event_id, :cart_id, :quantity)
  end
end
