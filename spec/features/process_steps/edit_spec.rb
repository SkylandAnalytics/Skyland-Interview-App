require 'rails_helper'

RSpec.describe "process step edit page", type: :feature do
  before :each do
    @process_step1 = ProcessStep.create!(name: 'Process Step 1', description: 'Description 1', position: 3)

    @parameter1 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 2.8)
    @parameter2 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 33.1)

    visit process_steps_path
  end

  describe 'happy path' do
    it 'shows list of process steps' do
      expect(page).to have_content('Process Step 1')

      click_on 'Edit'

      expect(current_path).to eq(edit_process_step_path(@process_step1))

      expect(page).to have_content('Edit Process Step Details')
      expect(page).to have_field('Name')
      expect(page).to have_field('Description')
      expect(page).to have_field('Position')

      fill_in 'Name', with: 'New Name'

      click_on 'Submit'
      expect(page).not_to have_content('Process Step 1')
      expect(page).to have_content('New Name')
    end
  end
end
