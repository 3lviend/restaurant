class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!
  def new
    super
  end

  def create
    waitress = Role.find_by_name "waitress"
    params[:user][:role_id] = waitress.id
    @user = User.new(params_user)
    if @user.save
      redirect_to root_path
    else
      render :back
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation, :role_id)
  end

end