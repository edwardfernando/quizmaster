class Api::V1::QuizController < ApplicationController
  def random
    respond_with Question.all.sample
  end

  def check_answer
    q = Question.find(request["id"])

    if NumbersInWords.in_numbers(q.answer) == NumbersInWords.in_numbers(request.parameters["answer"])
      render :json => {:status => true}, status: :ok
      return
    end

    render :json => {:status => false}, status: :ok
  end
end
