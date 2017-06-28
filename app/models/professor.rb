class Professor < ApplicationRecord
    has_many :documents
    validates :name, presence: true
    validates :email, presence: true
end
