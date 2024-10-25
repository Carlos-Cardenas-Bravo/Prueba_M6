class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_application, only: %i[show destroy]
  before_action :check_ownership, only: %i[destroy]

  # El administrador puede ver todas las postulaciones, los usuarios solo las suyas.
  def index
    if current_user.admin?
      @job_applications = JobApplication.all
    else
      @job_applications = current_user.job_applications
    end
  end

  # Cualquier usuario puede ver su propia postulación, o el administrador puede verlas todas.
  def show
  end

  # Los usuarios postulan a ofertas laborales.
  def create
    @job_offer = JobOffer.find(params[:job_offer_id])
    @job_application = current_user.job_applications.new(job_offer: @job_offer, status: "pending")

    respond_to do |format|
      if @job_application.save
        format.html { redirect_to @job_offer, notice: "Te has postulado exitosamente a esta oferta." }
        format.json { render :show, status: :created, location: @job_application }
      else
        format.html { render "job_offers/show", status: :unprocessable_entity }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # Solo los usuarios pueden eliminar sus propias postulaciones.
  def destroy
    @job_application.destroy!
    respond_to do |format|
      format.html { redirect_to job_applications_path, notice: "Has cancelado tu postulación.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Verificar que el usuario es dueño de la postulación que intenta eliminar.
  def check_ownership
    unless current_user.admin? || @job_application.user == current_user
      redirect_to job_applications_path, alert: "No tienes permiso para realizar esta acción."
    end
  end

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params
    params.require(:job_application).permit(:user_id, :job_offer_id, :status)
  end
end
