class ProcessStep < ApplicationRecord
  validates :description, :name, :position, presence: true
  has_many :parameters, dependent: :destroy
end
