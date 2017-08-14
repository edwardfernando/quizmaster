require 'rails_helper'

RSpec.describe Api::Quiz::QuestionsController, type: :controller do
  
  describe "#index" do
    context "when GET request come to /questions.json" do
      it "responds with 200" do
        get :index, format: :json
        expect(response.status).to eq(200)
      end
      
      it "renders array of questions" do
        get :index, format: :json
        expect(JSON(response.body)).to be_instance_of(Array)
        expect(JSON(response.body).size).to be >= 0
      end
    end
  end
  
  describe "#show" do
    context "when GET request come to /questions/:id" do
      it "renders a json of question" do
        random_question = Question.all.sample
        get :show, id: random_question.id, format: :json
        
        expect(JSON(response.body)["question"]).to eq(random_question.question)
        expect(response.status).to eq(200)
      end
    end
  end

  describe "#create" do
    context "when POST request come to /questions" do
      it "saves a question instance" do
        post :create, "question":{"question":"xxx","answer":"yyy"}, format: :json
        expect(Question.where(question: "xxx", answer: "yyy")).to exist
        expect(Question.all.size).to be > 0
      end
    end
  end
  
  describe "#destroy" do
    context "when DELETE request come to /questions/:id" do
      it "deletes a question instance" do
        random_question = Question.all.sample
        delete :destroy, id: random_question.id, format: :json
        
        expect(response.status).to eq(204)
        expect{
          Question.find(random_question.id)
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
  
  describe "#update" do
    context "where PUT request come to /questions/:id" do
      it "updates a question instace" do
        random_question = Question.all.sample
        put :update, id: random_question.id, "question":{"question":"xxx-#{random_question.id}","answer":"yyy-#{random_question.id}"}, format: :json
        
        expect(Question.find(random_question.id).question).to eq("xxx-#{random_question.id}")
        expect(Question.find(random_question.id).answer).to eq("yyy-#{random_question.id}")
      end
    end
  end
end