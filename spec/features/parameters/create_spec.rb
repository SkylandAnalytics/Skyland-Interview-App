require 'rails_helper'

RSpec.describe "parameter create", type: :feature do
  before :each do
    @process_step1 = ProcessStep.create!(name: 'Process Step 1', description: 'Description 1', position: 3)

    @parameter1 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 2.8)
    @parameter2 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 33.1)

    visit process_steps_path
  end

  describe 'happy path' do
    it 'can add a parameter measurement to a process step' do
      expect(page).to have_content('Process Step 1')
      expect(page).to have_field('measurement')
      fill_in 'measurement', with: 2.7
      click_on "Add"

      expect(page).to have_content(2.7)
    end
  end

  describe 'sad path' do
    it 'can add a parameter measurement to a process step' do
      expect(page).to have_content('Process Step 1')
      expect(page).to have_field('measurement')
      fill_in 'measurement', with: 99
      click_on "Add"

      expect(page).not_to have_content(99)
      expect(page).to have_content('Check measurement threshold guidelines')
    end
  end
end
