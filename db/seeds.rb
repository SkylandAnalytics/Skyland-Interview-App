# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ProcessStep.destroy_all
Parameter.destroy_all

process_step1 = FactoryBot.create(:process_step)
process_step2 = FactoryBot.create(:process_step)
process_step3 = FactoryBot.create(:process_step)
process_step4 = FactoryBot.create(:process_step)

FactoryBot.create(:parameter, process_step_id: process_step1.id)
FactoryBot.create(:parameter, process_step_id: process_step2.id)
FactoryBot.create(:parameter, process_step_id: process_step3.id)
FactoryBot.create(:parameter, process_step_id: process_step3.id)
FactoryBot.create(:parameter, process_step_id: process_step4.id)
