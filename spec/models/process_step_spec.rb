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
end
