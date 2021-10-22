require 'rails_helper'

RSpec.describe 'Process Step Udpate' do
  before :each do
    @process_step_1 = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)

    @process_step_1.parameters.create!(measurement: 4.7)
  end

  it 'updates a Process Step' do
    visit "/process_steps/#{@process_step_1.id}"

    expect(page).to_not have_content('New Text')

    click_on("Update #{@process_step_1.name}")

    expect(current_path).to eq("/process_steps/#{@process_step_1.id}/edit")

    fill_in :process_step_description, with: 'New Text'

    click_on('Submit')

    expect(current_path).to eq("/process_steps/#{@process_step_1.id}")

    expect(page).to have_content('New Text')
  end
end
