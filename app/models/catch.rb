class Catch < ApplicationRecord
  belongs_to :user
  belongs_to :fish
  has_many :products, dependent: :destroy
end
