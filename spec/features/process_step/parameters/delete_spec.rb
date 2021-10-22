require 'rails_helper'

RSpec.describe 'Process Step Parameter Delete' do
  before :each do
    @process_step_1 = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)

    @param_1 = @process_step_1.parameters.create!(measurement: 4.7)
    @param_2 = @process_step_1.parameters.create!(measurement: 13)
  end

  it 'deletes a given parameter' do
    visit "/process_steps/#{@process_step_1.id}/parameters"

    expect(page).to have_content(@param_1.measurement)

    click_on "Delete 4.7"

    expect(current_path).to eq("/process_steps/#{@process_step_1.id}/parameters")

    expect(page).to_not have_content(@param_1.measurement)
  end
end
