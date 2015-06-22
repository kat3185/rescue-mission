class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort_by(&:created_at).reverse
  end
end
