class Parameter < ApplicationRecord

  belongs_to :process_step

  validates :measurement, presence: true
  validates :measurement, numericality: { :greater_than => -5.0 }
  validates :measurement, numericality: { :less_than => 50.3 }
end
