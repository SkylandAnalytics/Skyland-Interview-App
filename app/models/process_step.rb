class ProcessStep < ApplicationRecord
  has_many :parameters, dependent: :destroy
end
