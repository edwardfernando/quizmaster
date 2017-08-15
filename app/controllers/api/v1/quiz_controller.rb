class Api::V1::QuizController < ApplicationController
  def random
    respond_with Question.all.sample
  end

  def check_answer
    q = Question.find(request["id"])
    
    if NumbersInWords.in_numbers(q.answer) == NumbersInWords.in_numbers(JSON(request["answer"])["answer"])
      respond_with :api, :v1, q, status: :ok
      return
    end

    respond_with :api, :v1, Question.new, status: :not_found
  end
end
