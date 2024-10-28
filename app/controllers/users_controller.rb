class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @job_applications = @user.job_applications
    render 'profile'
  end
end
