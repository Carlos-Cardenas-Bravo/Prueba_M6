require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @normal_user = users(:normal_user1)
  end

  test "normal user should update profile" do
    sign_in @normal_user
    patch user_registration_path, params: { user: { name: 'Nuevo nombre', email: 'nuevoemail@mail.com', current_password: '123456' } }
    assert_redirected_to job_offers_path
    assert_equal 'Tu cuenta ha sido actualizada correctamente.', flash[:notice]
  end
end





