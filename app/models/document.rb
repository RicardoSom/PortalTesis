class Document < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader
    has_and_belongs_to_many :tags
    belongs_to :user
    belongs_to :professor
    belongs_to :student
    validates :title, presence: true
    validates :abstract, presence: true
    validate :comprobar_fecha


    def comprobar_fecha
      if datepublished.present? and datepublished > Date.today
        errors.add(:datepublished, "La fecha no puede ser mayor a la de hoy")
      end
    end
end
