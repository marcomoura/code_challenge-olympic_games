class CompetitionsController < ApplicationController
  rescue_from ActionController::ParameterMissing, ActiveRecord::RecordInvalid do
    head 400
  end
  rescue_from FinishedError do
    head 403
  end
  rescue_from ActiveRecord::RecordNotFound do
    head 404
  end
  rescue_from AthleteNotFoundError do
    render 'athletes/not_found', status: 400
  end

  # POST /competitions
  def create
    @competition = CompetitionFacade.create competition_params
    render status: 201
  end

  # DELETE /competitions
  def destroy
    CompetitionFacade.finish params[:id]
    head 200
  end

  # GET /competitions/1
  def show
    @status, @results = CompetitionFacade.ranking params[:id]
    render status: 200
  end

  # PUT /competitions
  def update
    if CompetitionFacade.add_result params[:id], competition_params
      head 204
    else
      head 400
    end
  end

  private

  def competition_params
    params.require(:competition).permit :sport, :id,
                                        athletes: %w(name code),
                                        results: %w(athlete_code score)
  end
end
