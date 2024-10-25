class JobOffersController < ApplicationController
  before_action :authenticate_user!  # Asegura que el usuario esté autenticado
  before_action :check_admin, except: [:index, :show]  # Restringe ciertas acciones solo al administrador
  before_action :set_job_offer, only: %i[show edit update destroy]

  # GET /job_offers or /job_offers.json
  def index
    @job_offers = JobOffer.all
  end

  # GET /job_offers/1 or /job_offers/1.json
  def show
  end

  # GET /job_offers/new
  def new
    @job_offer = JobOffer.new
  end

  # GET /job_offers/1/edit
  def edit
  end

  # POST /job_offers or /job_offers.json
  def create
    @job_offer = JobOffer.new(job_offer_params)

    respond_to do |format|
      if @job_offer.save
        format.html { redirect_to @job_offer, notice: "Oferta laboral creada exitosamente." }
        format.json { render :show, status: :created, location: @job_offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_offers/1 or /job_offers/1.json
  def update
    respond_to do |format|
      if @job_offer.update(job_offer_params)
        format.html { redirect_to @job_offer, notice: "Oferta laboral actualizada exitosamente." }
        format.json { render :show, status: :ok, location: @job_offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_offers/1 or /job_offers/1.json
  def destroy
    @job_offer.destroy!
    respond_to do |format|
      format.html { redirect_to job_offers_path, notice: "Oferta laboral eliminada exitosamente.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Verificar si el usuario es administrador
  def check_admin
    redirect_to root_path, alert: 'Acceso no autorizado.' unless current_user.admin?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_job_offer
    @job_offer = JobOffer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_offer_params
    params.require(:job_offer).permit(:title, :description)
  end
end
