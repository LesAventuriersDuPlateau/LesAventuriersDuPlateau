class Event < ApplicationRecord
    has_many :orders, dependent: :nullify
    belongs_to :user

    validates :title, :description, :price, :city, :zip_code, :start_date, :duration, presence: true
end
