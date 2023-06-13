class Event < ApplicationRecord
    has_many :orders, dependent: :nullify
end
