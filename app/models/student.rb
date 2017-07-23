class Student < ApplicationRecord
  belongs_to :career
  has_many :documents

  def self.search(pattern)
    if pattern.blank?
      all
    else
      where('name ILIKE ? or last_name ILIKE ?', "%#{pattern}%","%#{pattern}%")
    end
  end
end
