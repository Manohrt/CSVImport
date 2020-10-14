class Mapping < ApplicationRecord
	has_many :questions,  inverse_of: :mappings
end
