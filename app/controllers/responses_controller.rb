class ResponsesController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @responses = @question.responses
  end

  def new
    @question = Question.find(params[:question_id])
    @response = Response.new
  end

  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.question = @question
    if @response.save
      flash[:notice] = "Response saved!"
      redirect_to question_path(@question)
    else
      flash[:notice] = "Response not saved."
      redirect_to question_path(params[:question_id])
    end
  end

  protected
  def response_params
    params.require(:response).permit(:description)
  end
end
