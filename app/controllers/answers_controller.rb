class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      render text: 'aw yah'
    else
      render text: 'die in a fire'
    end
  end

  private

    def answer_params
      params.require(:answer).permit(:body)
    end
end
