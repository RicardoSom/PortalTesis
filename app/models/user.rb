class User < ApplicationRecord
    has_many :documents
    validates :name, presence: true
    validates :lastname, presence: true
    validates :rut, numericality: true
    validates :email, presence: true
end
