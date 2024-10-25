class Admin::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :check_if_admin
  skip_before_action :require_no_authentication, only: [:new, :create]

  # GET /users/sign_up
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(sign_up_params)

    if @user.save
      flash[:notice] = "Usuario creado exitosamente. ¿Deseas agregar otro usuario?"
      redirect_to new_user_registration_path # Redirige nuevamente al formulario de registro
    else
      render :new
    end
  end

  private

  def check_if_admin
    unless current_user.admin?
      redirect_to root_path, alert: "No tienes permiso para registrar nuevos usuarios."
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end