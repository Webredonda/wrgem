class Users::RegistrationsController < Devise::RegistrationsController


  def layout_admin
    if user_signed_in?
      "admin"
    else
      "login"
    end
  end

  def new
    redirect_to admin_path
  end

  layout :layout_admin

  before_action :authenticate_user!
end
