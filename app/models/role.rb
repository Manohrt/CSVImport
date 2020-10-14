class Role < ApplicationRecord
	has_many :questions, inverse_of: :roles
end
