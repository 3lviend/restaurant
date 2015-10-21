class RoutesController < ActionController::Base
  before_filter :authenticate_user!

  def root
    puts current_user.role
    root_p = case current_user.role.name
      when 'admin'
        admin_quicklink_path
      when 'waitress'
        orders_path
      when 'chef'
        chefs_path
      else
        customer_path
      end

    redirect_to root_p 
  end
end