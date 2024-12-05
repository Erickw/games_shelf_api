class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :update, :destroy]

  def index
    @evaluations = Evaluation.where(user_id: params[:user_id])
    render json: @evaluations
  end

  def show
    render json: @evaluation
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      render json: @evaluation, status: :created
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      render json: @evaluation
    else
      render json: @evaluation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @evaluation.destroy
    head :no_content
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:rating, :game_name, :user_id)
  end
end
