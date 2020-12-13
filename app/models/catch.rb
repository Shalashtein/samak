class Catch < ApplicationRecord
  belongs_to :user
  belongs_to :fish
  has_one :product, dependent: :destroy
end
