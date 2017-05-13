class DocumentsTag < ApplicationRecord
  belongs_to :tag
  belongs_to :document
end
