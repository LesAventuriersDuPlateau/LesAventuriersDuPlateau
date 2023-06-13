class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders, dependent: :nullify
end
