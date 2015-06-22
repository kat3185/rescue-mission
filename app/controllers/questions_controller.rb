class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort_by(&:created_at).reverse
  end

  def show
    @question = Question.where(id: params[:id]).first
  end
end
