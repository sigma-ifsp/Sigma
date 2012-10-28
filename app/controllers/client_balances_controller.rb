class ClientBalancesController < ApplicationController
	def balance
		@promotion = Promotion.find(params[:promotion_id])
		@client = Client.find_by_cpf(params[:cpf])
	end
end