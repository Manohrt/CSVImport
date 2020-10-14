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
  		if Role.find_by_name(data[6])
  		 role =Role.find_by_name(data[6])
  		else
  		 role = Role.create!(name: data[6])
  		end
  		question.role_id = role.id
  		question.is_required = data[7]
  		question.conditions = data[8]
  		if Mapping.find_by_name(data[9])
  		 mapping =Mapping.find_by_name(data[9])
  		else
  		 mapping = Mapping.create!(name: data[9])
  		end
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
