class QuestionsController < ApplicationController
  def index
  	@questions = Question.all
  end

  def import
  	if params[:file]
	  	Question.import(params[:file])
	  	redirect_to root_url, notice: 'CSV was successfully Imported!'
	else
		redirect_to root_url
		flash.alert = 'Try Again'
	end
  end
end
