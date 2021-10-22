require 'rails_helper'

RSpec.describe 'Process Step Create' do
  it 'creates a Process Step' do
    visit '/process_steps'

    click_on('Create New Process Step')

    fill_in :process_step_name, with: 'Test'
    fill_in :process_step_description, with: 'Test'
    fill_in :process_step_position, with: 1

    click_on('Submit')

    expect(current_path).to eq("/process_steps/#{ProcessStep.last.id}/parameters/new")

    fill_in :parameter_measurement, with: 4.5

    click_on 'Submit'

    id = ProcessStep.last.id

    expect(current_path).to eq("/process_steps/#{id}")
  end
end
