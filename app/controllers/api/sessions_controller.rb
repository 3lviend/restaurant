module Api
	class SessionsController < Api::BaseController
		
		def create
			user_password = params[:session][:password]
			user_email = params[:session][:email]
			user = user_email.present? && User.find_by(email: user_email)
			if user == nil
				render json: { errors: "Invalid email or password" }, status: 422
				return
			end
			if user.valid_password? user_password
				sign_in user, store: false
				user.generate_authentication_token!
				user.save
				render json: { access_token: user.access_token, login: true, id: user.id, email: user.email}, status: 200
			else
				render json: { errors: "Invalid email or password" }, status: 422
			end
		end

		def delete
			user = User.find_by(access_token: params[:id])
			user.save
			head 204
		end

	end
end