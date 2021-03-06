# encoding: utf-8
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
cashier_role = Role.create(name: 'cashier', description: 'Company employee')

PromotionCategory.create([{ name: 'points'}, {name: 'value'}])

# Sample Companies
company = Company.create(name: 'Mit su yan', cnpj: '11284880000191', email: 'mit@email.com')

# Admin user
admin_user = User.new(username: 'admin', email: 'admin@empresa.com.br', password: '123456', password_confirmation: '123456')
admin_user.role = admin_role
admin_user.save
admin = Employee.create(company: company, user: admin_user)

# Cashier
cashier_user = User.new(username: 'caixa', email: 'cashier@mitsuyan.com.br', password: '123456', password_confirmation: '123456')
cashier_user.role = cashier_role
cashier_user.save
cashier = Employee.create(company: company, user: cashier_user)


# Root - You should change this password
root_user = User.create(username: 'root', email: 'root@sigma.com.br', password: '123456', password_confirmation: '123456')
root_user.role = root_role
root_user.save
# Clients
[['cliente1','61817851160'],['cliente2','73848058642'],
  ['cliente3','02851238078'],['cliente4', '52391246714']].each do |user|
  u = User.new(username: user[0], email: "#{user[0]}@sigma.com.br", 
              password: '123456', password_confirmation: '123456')
  u.role = client_role
  u.save
  client = Client.new(cpf: user[1])
  client.user = u
  client.save
end


# Promotions by value
1.upto(10) do |x|
  p = Promotion.new({name: "Promoção #{x}", initial_date: 1.day.ago,
    ending_date: 1000.days.from_now,
    value: 10, 
    points: 1,
    description: "Promotion #{x}",
    points_to_exchange: 100,
  })
  p.company = company
  p.promotion_category = PromotionCategory.last
  p.user_id = admin_user.id
  p.save
end

# Promotions by points
1.upto(10) do |x|
  p = Promotion.new({name: "Promoção #{x}", initial_date: 1.day.ago,
    ending_date: 1000.days.from_now,
    points: 1,
    description: "Promotion #{x}",
    points_to_exchange: 10,
  })
  p.company = company
  p.promotion_category = PromotionCategory.first
  p.user_id = admin_user.id
  p.save
end

(30.days.ago.to_date..Date.today).each do |date|
  1.upto(2) do |x|
    client = Client.first(:offset => rand(Client.count))
    p = Point.new
    p.cpf = client.cpf
    p.company = company
    p.promotion = Promotion.first(:offset => rand(Promotion.count))
    p.value = (rand * 200).round(2)
    p.created_at = date.to_time
    p.save
  end
end
