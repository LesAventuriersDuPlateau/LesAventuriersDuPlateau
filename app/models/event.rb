class Event < ApplicationRecord
    has_many :orders, dependent: :nullify
    belongs_to :user

    validates :title, :description, :price, :city, :zip_code, :start_date, :duration, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :title, length: { maximum: 30 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "ne peut contenir que des lettres et des espaces" }
    validates :description, length: { maximum: 250 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "ne peut contenir que des lettres et des espaces" }
    validates :city, length: { maximum: 30 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "ne peut contenir que des lettres et des espaces" }
    validates :duration, numericality: { greater_than: 0 }
end
