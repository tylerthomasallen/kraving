# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def rand_id
rand(1..100_000)
end

company_id = rand_id

# campuses
mountain_view = Campus.create!(
  id: rand_id,
  name: "Mountain View",
  address: "1600 Amphitheatre Parkway",
  company_id: company_id
)
new_york = Campus.create!(
  id: rand_id,
  name: "New York",
  address: "76 Ninth Avenue",
  company_id: company_id
)

# managers
larry = Employee.create!(
  id: rand_id,
  fname: "Larry",
  lname: "Page",
  campus_id: mountain_view.id
)
michael = Employee.create!(
  id: rand_id,
  fname: "Michael",
  lname: "Scott",
  campus_id: mountain_view.id
)
sergey = Employee.create!(
  id: rand_id,
  fname: "Sergey",
  lname: "Brin",
  campus_id: new_york.id
)
mountain_view.update_attributes(campus_manager_id: sergey.id)

# company
Company.create!(
  id: company_id,
  name: "Google",
  ceo_id: larry.id
)

# programmers
oscar = Employee.create!(
  id: rand_id,
  fname: "Oscar",
  lname: "Martinez",
  campus_id: new_york.id
)
jim = Employee.create!(
  id: rand_id,
  fname: "Jim",
  lname: "Halpert",
  campus_id: mountain_view.id
)
kevin = Employee.create!(
  id: rand_id,
  fname: "Kevin",
  lname: "Malone",
  campus_id: mountain_view.id
)
pam = Employee.create!(
  id: rand_id,
  fname: "Pam",
  lname: "Beesly",
  campus_id: mountain_view.id
)

# projects
search = Project.create!(
  id: rand_id,
  project_manager_id: michael.id,
  title: "Google Search",
  description: "Find anything instantly"
)

# assignments
ProjectAssignment.create!(id: rand_id, project_id: search.id, programmer_id: jim.id)
ProjectAssignment.create!(id: rand_id, project_id: search.id, programmer_id: kevin.id)
ProjectAssignment.create!(id: rand_id, project_id: search.id, programmer_id: pam.id)

# computers
first_computer_id = rand_id
Computer.create!(id: first_computer_id, model: "MacBook Air", owner_id: jim.id)
Computer.create!(id: first_computer_id + 1, model: "MacBook Pro", owner_id: larry.id)
