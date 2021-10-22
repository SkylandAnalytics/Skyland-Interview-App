require 'rails_helper'

RSpec.describe ProcessStep do
  describe '#validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:position) }
  end

  describe '#relationships' do
    it { should have_many(:parameters) }
  end

  describe '#no_params?' do
    it 'returns true if a Process Step has no parameters' do
      process_step = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)

      expect(process_step.no_params?).to eq(true)
    end
  end

  describe '#measurement_less_than_last?' do
    it 'returns true if given measurement is less than its last associated measurement' do
      process_step = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)
      process_step.parameters.create!(measurement: 4.7)

      expect(process_step.measurement_less_than_last?(4.0)).to eq(true)
    end
  end

  describe '#last_measurement' do
    it 'returns the last parameters measurement for a given process_step' do
      process_step = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)
      process_step.parameters.create!(measurement: 4.7)

      expect(process_step.last_measurement).to eq(4.7)
    end
  end
end
