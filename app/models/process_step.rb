class ProcessStep < ApplicationRecord
  validates :description, :name, :position, presence: true
  has_many :parameters, dependent: :destroy

  def no_params?
    parameters
    .last
    .nil?
  end

  def measurement_greater_than_last?(measurement)
    measurement > self.parameters.last.measurement.to_f
  end
end
