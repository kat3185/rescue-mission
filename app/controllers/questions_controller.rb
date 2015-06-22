class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort_by(&:created_at).reverse
  end

  def show
    @question = Question.where(id: params[:id]).first
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(drink_params)
    if @question.save
      flash[:notice] = 'Your question was submitted.'
      redirect_to questions_path
    else
      flash[:notice] = 'Title must be 40 characters, description must be 150.'
      render :new
    end
  end

  protected
  def drink_params
    params.require(:question).permit(:title, :description)
  end
end
