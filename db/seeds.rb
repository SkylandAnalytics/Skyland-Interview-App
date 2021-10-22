ProcessStep.delete_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p_s_1 = ProcessStep.create(name: "Process 1", description: "this is a description example for the process step model. The process step that this text for is: Process Step 1", position: 1)
p_s_2 = ProcessStep.create(name: "Process 2", description: "this is a description example for the process step model. The process step that this text for is: Process Step 2", position: 2)
p_s_3 = ProcessStep.create(name: "Process 3", description: "this is a description example for the process step model. The process step that this text for is: Process Step 3", position: 3)
p_s_4 = ProcessStep.create(name: "Process 4", description: "this is a description example for the process step model. The process step that this text for is: Process Step 4", position: 4)
p_s_5 = ProcessStep.create(name: "Process 5", description: "this is a description example for the process step model. The process step that this text for is: Process Step 5", position: 5)

p_s_1.parameters.create!(measurement: 1)
p_s_2.parameters.create!(measurement: 2)
p_s_3.parameters.create!(measurement: 3)
p_s_4.parameters.create!(measurement: 4)
p_s_5.parameters.create!(measurement: 5)
