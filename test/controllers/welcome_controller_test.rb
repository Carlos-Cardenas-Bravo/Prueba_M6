require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path  # Cambia welcome_index_url por root_path si welcome/index es la ruta raíz
    assert_response :success
  end
end

