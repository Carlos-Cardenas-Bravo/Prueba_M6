require "test_helper"

class Admin::RegistrationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:admin) # Asegúrate de tener un fixture con el usuario admin
  end

  test "admin should create a new user" do
    sign_in @admin
    assert_difference('User.count', 1) do
      post admin_user_registration_path, params: { user: { name: 'Nuevo Usuario', email: 'nuevo@usuario.com', password: '123456', role: 'normal_user' } }
    end
    assert_redirected_to admin_users_path

    # Verificamos que el nuevo usuario ha sido creado
    follow_redirect!
    assert_select "p", /Usuario creado exitosamente.|Bienvenido a 2C Gestión Inmobiliaria/
  end
end


