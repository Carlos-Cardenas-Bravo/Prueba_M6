class Users::RegistrationsController < Devise::RegistrationsController
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
end
