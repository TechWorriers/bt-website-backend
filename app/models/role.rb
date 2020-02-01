class Role < ApplicationRecord
  has_many :users, inverse_of: :role, dependent: :destroy
end
