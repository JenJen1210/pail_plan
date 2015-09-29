class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:user_name, :email, :password, :password_confirmation, :description, :location)
  end
end
