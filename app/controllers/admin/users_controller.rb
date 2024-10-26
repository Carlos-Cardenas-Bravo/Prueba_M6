class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.where(role: :normal_user)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    # Si la contraseña está vacía, no actualices la contraseña
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      redirect_to admin_users_path, notice: "Usuario actualizado correctamente."
    else
      flash.now[:alert] = "Hubo un error al actualizar el usuario."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "Usuario eliminado correctamente."
  end

  def show
    @user = User.find(params[:id])
    @job_applications = @user.job_applications.where(checked: false)

    # Marcar las postulaciones como revisadas
    @job_applications.update_all(checked: true)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_if_admin
    unless current_user.admin?
      redirect_to root_path, alert: "No tienes permiso para acceder a esta sección."
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
