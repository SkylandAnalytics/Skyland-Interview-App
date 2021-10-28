require 'rails_helper'

RSpec.describe ProcessStep, type: :model do
  describe "relationships" do
    it { should have_many :parameters }
  end
end
