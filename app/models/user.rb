class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name, :phone, presence: true
         validates :phone, numericality: true
         validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
         validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
    has_one :cart
    has_many :payments
    has_many :orders
    has_many :address, as: :addressable

end
