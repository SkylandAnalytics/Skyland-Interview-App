require 'rails_helper'

RSpec.describe 'Process Step Parameters Create' do
  before :each do
    @process_step_1 = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)
    @param_1 = @process_step_1.parameters.create!(measurement: 4.7)
  end

  it 'creates a parameter for a given process' do
    visit "/process_steps/#{@process_step_1.id}"

    click_on 'Create Parameter'

    fill_in :parameter_measurement, with: 4.0

    click_on 'Submit'

    expect(current_path).to eq("/process_steps/#{@process_step_1.id}")

    expect(page).to have_content(4.0)
  end
end
