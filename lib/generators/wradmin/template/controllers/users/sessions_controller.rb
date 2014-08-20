class Users::SessionsController < Devise::SessionsController
  layout "login"

  def destroy
    session.destroy
    redirect_to admin_path
  end

end
