require "test_helper"

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @normal_user = users(:normal_user1) # Usuario normal desde los fixtures
    @job_offer = job_offers(:analista_datos) # Oferta de trabajo desde los fixtures
  end

  test "registered user can apply to a job offer" do
    sign_in @normal_user
    assert_difference('JobApplication.count', 1) do
      post job_offer_job_applications_path(@job_offer), params: { job_application: { job_offer_id: @job_offer.id } }
    end
    assert_redirected_to job_offer_path(@job_offer)
  end

  test "unregistered user cannot apply to a job offer" do
    assert_no_difference('JobApplication.count') do
      post job_offer_job_applications_path(@job_offer), params: { job_application: { job_offer_id: @job_offer.id } }
    end
    assert_redirected_to new_user_session_path
  end
end

