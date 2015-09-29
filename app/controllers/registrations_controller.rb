class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :about_me, :location)
  end
end
