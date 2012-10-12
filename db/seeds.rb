# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
# Roles
Role.create([
            { name: 'root', description: 'System admin'},
            { name: 'client', description: 'Companies Client'},
            { name: 'admin', description: 'Company admin' },
            { name: 'employee', description: 'Company employee'}
])

PromotionCategory.create([{ name: 'points'}, {name: 'value'}])
