module ApplicationHelper

  def current_user_admin?
    redirect_to root_path unless current_user.role.name == "admin"
  end

  # def error_messages_on(object, method, option = {})
  #   object = convert_to_model_(object)
  #   obj = object.respond_to?(:errors) ? object : instance_variable_get("@#{object}")
  #   if obj && obj.errors[method].present?
  #     errors = obj.errors[method].uniq.map {|err| h(err) }.join('</br>').html_safe
  #     content_tag(:span, errors, :class => 'formError')
  #     else
  #     ''
  #   end
    
  # end
  
end
