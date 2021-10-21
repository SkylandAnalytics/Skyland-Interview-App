# Skyland Analytics Interview Application

Please download the project to your workstation. When done, please submit a Pull Request with your first name and last initial as the branch name (ex: matt-m branch name)

## Front End Developer

* Please run the following to ensure the Rails project is working:
```
bundle
rails db:create
rails db:migrate
rails db:seed
rails s
```
* At this point you should visit localhost:3000/ and it should confirm that you've successfully started your Rails application. If you are having any issues, please reach out to interviewer for assistance.

* use the following route process_steps/frontend to create a sortable grid that can reorder the rows of process steps. The javascript framework that must be used is Kendo. It's already installed on this application and should be ready for use by the developer. 
  - please place your kendo code inside: `app/view/frontend/index.js.erb`
  - use `@process_steps.to_json` to display the rails model as a json object

* style the grid so that is center of the screen and takes up 60% width of the entire screen. The header should be light blue and the individual rows should be alternating colors of light yellow and white.


** Bonus: any extra functionality that you wish to add to the grid or style will go towards your final score in this exercise.

## Backend Developer 

* add a child relationship in the rails application named parameter. It must have the following validations and values:
  - measurement:integer
  - measurement must be present if process step is filled out.
  - Every measurement must be greater then -5.0 and less then 50.3
  - if another measurement is added, it cannot be greater then any previously added measurements

* add a basic CRUD setup for the parent and child relationship
  - can add as many parameters to process step as needed
  - has to be at least one measurement for each created process step

* allow the user to delete process steps
  - within the process step view, the user should be able to also remove the parameters individually using AJAX functionality. 

** Bonus: if you can use the Kendo javascript framework to display the values above in a grid with parameter(s) added to each process step row as a comma delimited value in a measurements column:

### Example

| Name  | Description | Position | Measurements |
| ------------- |:-------------:| ------------- |:-------------:| 
| Process Step 1     | Description 1     | 1      | 2,3.4,50     |
| Process Step 2     | Description 2     | 2      | 4.3,2     |







