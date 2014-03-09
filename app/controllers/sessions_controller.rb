class SessionsController < ApplicationController
	def to_hash(resource)
		ActiveSupport::JSON.decode(resource.to_json)
	end

	def create
		account = Account.find_by_name(params[:account][:name]) 
		sso_account = Account.find_by_sso_token(params[:account][:sso_token])
		if (account && account.authenticate(params[:account][:password])) || sso_account 
			
			account_hash = to_hash(account).merge(:services => account.services.map{|s| to_hash(s).merge(:datastores => s.datastores.map{|d| to_hash(d)})}) if account
			sso_account_hash = to_hash(sso_account).merge(:services => sso_account.services.map{|s| to_hash(s).merge(:datastores => s.datastores.map{|d| to_hash(d)})}) if sso_account
      render json: account_hash if account
			render json: sso_account_hash if sso_account
    else
      render json: nil
    end
	end
end