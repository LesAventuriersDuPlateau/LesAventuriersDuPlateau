class Event < ApplicationRecord
    has_many :orders, dependent: :nullify
    belongs_to :user

    validates :title, :description, :price, :city, :zip_code, :start_date, :duration, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
end
