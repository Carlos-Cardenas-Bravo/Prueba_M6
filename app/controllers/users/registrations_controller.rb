class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  protected

  # Permitir que los usuarios actualicen su perfil sin requerir la contraseña
  def update_resource(resource, params)
    if params[:password].blank?
      resource.update_without_password(params.except(:current_password))
    else
      resource.update_with_password(params)
    end
  end

  # Redirigir al listado de ofertas después de actualizar el perfil
  def after_update_path_for(resource)
    job_offers_path  # Redirige al listado de ofertas laborales
  end

  # Parámetros permitidos para la actualización del perfil
  def account_update_params
    params.require(:user).permit(
      :email,
      :name,
      :experience_years,
      :education_level,
      :previous_positions,
      :password,
      :password_confirmation,
      :current_password,
      :image_profile
    )
  end

end
