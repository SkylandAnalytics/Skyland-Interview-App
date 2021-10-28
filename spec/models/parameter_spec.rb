require 'rails_helper'

RSpec.describe Parameter, type: :model do
  describe "relationships" do
    it { should belong_to :process_step }

    it { should validate_presence_of :measurement }
    it { should validate_numericality_of :measurement }
    it { should validate_numericality_of :measurement }

  end
end
