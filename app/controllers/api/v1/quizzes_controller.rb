class Api::V1::QuizzesController < ApplicationController
  protect_from_forgery

  rescue_from Exception, with: :render_status_500

  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    quizzes = Quiz.order("RAND()").limit(5)
    render json: quizzes
  end

  private

  def render_status_404(exception)
    render json: { errors: [exception] }, status: 404
  end

  def render_status_500(exception)
    render json: { errors: [exception] }, status: 500
  end

end
