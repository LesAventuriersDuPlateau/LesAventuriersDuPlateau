module EventsHelper

    def save_events_in_cart
        if current_user != nil
            @events_in_cart = Order.where(cart_id:current_user.cart.id)
        end
    end

end
