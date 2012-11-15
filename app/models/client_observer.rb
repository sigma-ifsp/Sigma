class ClientObserver < ActiveRecord::Observer

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
