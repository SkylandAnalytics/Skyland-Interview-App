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
end
