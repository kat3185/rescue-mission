class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort_by(&:created_at).reverse
  end

  def show
    @question = Question.where(id: params[:id]).first
    @response = Response.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Your question was submitted.'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'Title must be 40 characters, description must be 150.'
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      flash[:notice] = 'Your question was updated.'
      redirect_to questions_path(@question)
    else
      flash[:notice] = 'Title must be 40 characters, description must be 150.'
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = 'Question deleted!'
    redirect_to questions_path
  end

  protected
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
