class ContactController < ApplicationController
  # GET /contact/company
  def company
  end

  # GET /contact/client
  def client
  end

  # POST /contact/send_to_sigma
  def send_to_sigma
    File.open(Rails.root.join("log/contacts.txt"),"a+") do |file|
      log = "\"#{Time.now}\""
      [:company_name,:company_email,:company_doc,:observations].each do |param|
        log << ",\"#{params[param]}\""
      end
      file.write(log)
    end
    flash[:notice] = "Mensagem enviada com sucesso!"
    redirect_to root_url
  end
end
