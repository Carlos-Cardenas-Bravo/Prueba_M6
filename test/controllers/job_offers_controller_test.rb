require "test_helper"

class JobOffersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin_user = users(:admin) # Cargar el usuario admin del fixture
    @normal_user = users(:normal_user1) # Cargar el usuario normal del fixture
    @job_offer = job_offers(:analista_datos) # Usar el fixture "analista_datos"
  end

  test "admin user should create job offer" do
    sign_in @admin_user
    assert_difference('JobOffer.count') do
      post job_offers_path, params: { job_offer: { title: 'Nueva oferta', description: 'Descripción de prueba' } }
    end
    assert_redirected_to job_offer_path(JobOffer.last)
  end

  test "normal user should not create job offer" do
    sign_in @normal_user
    assert_no_difference('JobOffer.count') do
      post job_offers_path, params: { job_offer: { title: 'Nueva oferta', description: 'Descripción de prueba' } }
    end
    assert_redirected_to root_path
    assert_equal 'Acceso no autorizado.', flash[:alert]
  end
end


