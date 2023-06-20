class User < ApplicationRecord
  #after_create :welcome_send
  has_one :cart
  has_many :events

  validates :email, 
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Entrez un email valide" }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # def welcome_send
  #   UserMailer.welcome_email(self).deliver_now
  # end
end
