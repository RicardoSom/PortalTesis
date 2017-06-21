class Student < ApplicationRecord
  belongs_to :career
  has_many :documents
end
