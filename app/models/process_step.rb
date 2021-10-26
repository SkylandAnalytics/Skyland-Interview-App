class ProcessStep < ApplicationRecord
  has_many :parameters
  validates_associated :parameters
end
