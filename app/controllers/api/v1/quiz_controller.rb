class Api::V1::QuizController < ApplicationController
  def random
    respond_with Question.all.sample
  end

  def check_answer
    q = Question.find(request["id"])
    
    if q.answer == JSON(request["answer"])["answer"]
      respond_with :api, :v1, q, status: :ok
      return
    end

    respond_with :api, :v1, Question.new, status: :not_found
  end
end
