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
      render text: 'aw yah'
    else
      render text: 'die in a fire'
    end
  end

  private

    def survey_params
      params.require(:survey).permit(:name)
    end
end
