class Cart < ApplicationRecord
  has_many :positions
  belongs_to :user
  has_many :items, through: :positions
end
