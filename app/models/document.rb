class Document < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader
    has_and_belongs_to_many :tags
    belongs_to :user
    belongs_to :school
    belongs_to :career
    validates :title, presence: true
    validates :abstract, presence: true
    validates :namestudent, presence: true
    validates :nameprofessor, presence: true
    validates :lastnamestudent, presence: true
    validates :lastnameprofessor, presence: true
    validates :datepublished, presence: true
end
