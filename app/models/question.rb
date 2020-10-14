class Question < ApplicationRecord
  require 'csv'
  belongs_to :role
  belongs_to :mapping

  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |data|
  		question = Question.new
  		question.pri = data[0]
  		question.question = data[1]
  		question.teaming_stages = data[2]
  		question.appears = data[3]
  		question.frequency = data[4]
  		question.question_type = data[5]
  		role = Role.find_or_create_by(name: data[6])
  		question.role_id = role.id
  		question.is_required = data[7]
  		question.conditions = data[8]
  		mapping = Mapping.find_or_create_by(name: data[9])
  		question.mapping_id = mapping.id
        question.save
    end
  end

  def role_name
  	role.name
  end
  
  def mapping_name
  	mapping.name
  end

end
