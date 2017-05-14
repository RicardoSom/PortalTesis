class Career < ApplicationRecord
    has_many :documents
    validates :namecareer, presence: true
end
