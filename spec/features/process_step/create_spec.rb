require 'rails_helper'

RSpec.describe 'Process Step Create' do
  it 'creates a Process Step' do
    visit '/process_steps'

    click_on('Create New Process Step')

    fill_in :name, with: 'Test'
    fill_in :description, with: 'Test'
    fill_in :position, with: 'Test'

    click_on('Submit')

    expect(cureent_path).to eq('/parameters/new')

    fill_in :measurement, with: 4.5

    click_on 'Submit'

    id = ProcessStep.last.id

    expect(current_path).to eq("/process_steps/#{id}")
  end
end
