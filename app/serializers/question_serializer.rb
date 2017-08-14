include ActiveModel::Serialization

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question
end