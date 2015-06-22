class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render text: 'aw yah'
    else
      render text: 'die in a fire'
    end
  end

  private

    def question_params
      params.require(:question).permit(:body, :survey_id)
    end
end
