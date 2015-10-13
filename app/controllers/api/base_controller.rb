class Api::BaseController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!
  skip_before_action :verify_authenticity_token

  def current_user
    @current_user ||= User.find_by(access_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" }, status: :unauthorized unless current_user.present?
  end

end
