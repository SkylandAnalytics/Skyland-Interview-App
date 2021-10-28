require 'rails_helper'

RSpec.describe "process step show page", type: :feature do
  before :each do
    @process_step1 = ProcessStep.create!(name: 'Process Step 1', description: 'Description 1', position: 3)
    @process_step2 = ProcessStep.create!(name: 'Process Step 2', description: 'Description 2', position: 5)

    @parameter1 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 2.8)
    @parameter2 = FactoryBot.create(:parameter, process_step_id: @process_step1.id, measurement: 33.1)

    visit process_step_path(@process_step1)
  end

  describe "happy path" do
    it 'shows process step attributes' do
      expect(page).to have_content('Process Step 1')
      expect(page).to have_content('Description 1')
      expect(page).to have_content(3)
      expect(page).not_to have_content('Description 2')
      expect(page).not_to have_content(5)
    end

    it 'shows measurements associated with that process step' do
      expect(page).to have_content(2.8)
      expect(page).to have_content('Description 1')
      expect(page).to have_content(33.1)
      expect(page).not_to have_content(11.1)
    end
  end
end
