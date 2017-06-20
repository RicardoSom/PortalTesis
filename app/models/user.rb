class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :documents
    validates :name, presence: true
    validates :lastname, presence: true
    validates :rut, numericality: true
    validates :email, presence: true
end
