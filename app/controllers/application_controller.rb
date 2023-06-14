class ApplicationController < ActionController::Base
    include ApplicationHelper
    after_action :create_cart_and_assign_to_current_user, only: [:create]
end
