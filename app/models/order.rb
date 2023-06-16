class Order < ApplicationRecord
  belongs_to :event
  belongs_to :cart

  def self.add_or_create_cart_event_link(permit_link_params)
  	if Order.find_by(cart_id: permit_link_params[:cart_id], event_id: permit_link_params[:event_id]) == nil
  		@new_event_add = Order.create(event_id: permit_link_params[:event_id], cart_id: permit_link_params[:cart_id], quantity: 1)
  	else
  		@new_event_add = Order.find_by(cart_id: permit_link_params[:cart_id], event_id: permit_link_params[:event_id])
  		@new_event_add.update(quantity: @new_event_add.quantity + 1)
  	end
  end
end
