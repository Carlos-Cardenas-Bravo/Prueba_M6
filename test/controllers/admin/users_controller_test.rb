require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:admin)
    @normal_user = users(:normal_user1)
    @job_offer = job_offers(:analista_datos)
  end

  test "admin should see new application link for unchecked applications" do
    sign_in @admin
    @normal_user.job_applications.create(job_offer: @job_offer, checked: false)
    get admin_users_path
    assert_select 'a', text: 'Nueva Postulación'
  end
end