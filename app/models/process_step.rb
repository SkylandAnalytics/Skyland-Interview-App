class ProcessStep < ApplicationRecord
  validates :description, :name, :position, presence: true
  has_many :parameters, dependent: :destroy

  def no_params?
    parameters
    .last
    .nil?
  end
end
