class Event < ApplicationRecord
    has_many :orders, dependent: :nullify

    validates :title, :description, :price, :city, :zip_code, :start_date, :duration, presence: true
end
