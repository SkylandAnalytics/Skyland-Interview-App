require 'rails_helper'

RSpec.describe 'Process Step Delete' do
  before :each do
    @process_step_1 = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)

    @process_step_1.parameters.create!(measurement: 4.7)
  end

  it 'deletes a given process step' do
    visit '/process_steps'

    expect(page).to have_content(@process_step_1.name)

    click_on "Delete"

    expect(current_path).to eq('/process_steps')
    expect(page).to_not have_content(@process_step_1.name)
  end
end
