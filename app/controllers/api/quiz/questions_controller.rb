class Api::Quiz::QuestionsController < ApplicationController
  def index
    respond_with Question.all, each_serializer: QuestionSerializer
  end
  
  def show
    respond_with Question.find(params['id']), serializer: QuestionSerializer
  end

  def create
    respond_with :api, :quiz, Question.create(question_params)
  end

  def destroy
    respond_with Question.destroy(params[:id])
  end

  def update
    q = Question.find(params['id'])
    q.update_attributes(question_params)
    respond_with q, json: q
  end

  private

  def question_params
    params.require(:question).permit(:id, :question, :answer)
  end
end
