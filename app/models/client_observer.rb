# Active Record Observer.
# Will call methods based on the event.
# These methods always receives a +Client+ object.
class ClientObserver < ActiveRecord::Observer
  # It creates +User+ with some random password.
  # The +User+ will have the role of client.
  def after_create(client)
    if not client.user
      password = rand(36**9).to_s(36)
      client.user = User.new(username: client.cpf,
                           email: "#{client.cpf}@sigma.com.br",
                           password: password,
                           password_confirmation: password,
                           temporary_password: password)
      client.user.role = Role.client
      client.save
    end
  end
end
