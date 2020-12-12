class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items, dependent: :destroy
  has_many :products, through: :items
end
