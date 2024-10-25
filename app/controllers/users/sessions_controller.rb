# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # Después de iniciar sesión redirige según el rol del usuario
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_users_path  # Redirige al listado de usuarios si es admin
    else
      job_offers_path   # Redirige al listado de ofertas si es un usuario normal
    end
  end
end
