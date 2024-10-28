class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @job_applications = @user.job_applications
    render 'profile'
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_profile_path, notice: 'Perfil actualizado correctamente.'
    else
      render 'profile'
    end
  end

  private

  # Permitir los parámetros necesarios, incluido image_profile
  def user_params
    params.require(:user).permit(:name, :email, :experience_years, :education_level, :previous_positions, :password, :image_profile)
  end
end
