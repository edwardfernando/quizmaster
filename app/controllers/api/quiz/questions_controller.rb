class Api::Quiz::QuestionsController < ApplicationController 
  
  def index
    respond_with Question.all, each_serializer: QuestionSerializer
  end
  
  def create
    respond_with :api, :quiz, Question.create(question_params)
  end
  
  def destroy
    respond_with Question.destroy(params[:id])
  end

  def update
    q = Question.find(params['id'])
    q.update_attributes(item_params)
    respond_with item, json: q
  end
  
  private 
  def question_params
    params.require(:question).permit(:id, :question, :answer)
  end
end