# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
MasterRole.destroy_all
Division.destroy_all
Employee.destroy_all

master = MasterRole.create!([
    {
        name:"HR Manager"
    },
    {
        name:"Project Manager"
    },
    {
        name:"Employee"
    }
])

division = Division.create!(
    name:"HR"
)

employee = Employee.create!(
    email: 'example@gmail.com',
    password: '12345678',
    name: 'Rohit Kumar',
    username: 'rohit',
    master_role_id:'1',
    division_id:'1'
)
p "Created #{Employee.count} Employee"
