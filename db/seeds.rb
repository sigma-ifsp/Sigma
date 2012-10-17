# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Roles - Important

root_role = Role.create(name: 'root', description: 'System admin')
client_role = Role.create(name: 'client', description: 'Companies Client')
admin_role = Role.create(name: 'admin', description: 'Company admin')
cashier_role = Role.create(name: 'employee', description: 'Company employee')

PromotionCategory.create([{ name: 'points'}, {name: 'value'}])

# Sample Companies
company = Company.create(name: 'Mit su yan', cnpj: '11.284.880/0001-91', email: 'mit@email.com')

# Admin user
admin_user = User.new(username: 'maria', email: 'admin@mitsuyan.com.br', password: '123456', password_confirmation: '123456', role: admin_role)
admin = Employee.create(name: 'Maria', company: company, user: admin_user)

# Cashier
cashier_user = User.new(username: 'ivete', email: 'cashier@mitsuyan.com.br', password: '123456', password_confirmation: '123456', role: cashier_role)
cashier = Employee.create(name: 'Ivete', company: company, user: cashier_user)
