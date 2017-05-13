class Document < ApplicationRecord
    has_and_belongs_to_many :tags
    belongs_to :user
    belongs_to :school
    belongs_to :career
end
