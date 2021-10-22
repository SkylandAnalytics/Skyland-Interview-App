require 'rails_helper'

RSpec.describe 'Process Steps Parameters Update' do
  before :each do
    @process_step_1 = ProcessStep.create!(name: 'First', description: 'Description of First step', position: 1)

    @process_step_1.parameters.create!(measurement: 4.7)
  end

  it 'can update a given parameter' do
    visit "/process_steps/#{@process_step_1.id}/parameters"

    expect(page).to have_content(4.7)

    click_on 'Edit Parameter'

    fill_in :measurement, with: 4.5

    expect(page).to have_content(4.5)
    expect(page).to_not have_content(4.7)
  end
end
