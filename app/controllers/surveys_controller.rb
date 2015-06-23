class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      if request.xhr?
        @question = Question.new
        render partial: 'questions/form'
      else
        render text: 'aw yah'
      end
    else
      render text: 'die in a fire'
    end
  end

  private

    def survey_params
      params.require(:survey).permit(:name)
    end
end
