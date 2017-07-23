class Professor < ApplicationRecord
    has_many :documents
    validates :name, presence: true
    validates :email, presence: true

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name ILIKE ?', "%#{pattern}%")
    end
  end
end
