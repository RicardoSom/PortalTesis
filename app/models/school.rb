class School < ApplicationRecord
    has_many :documents
    validates :nameschool, presence: true
end
