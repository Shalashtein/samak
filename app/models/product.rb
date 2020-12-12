class Product < ApplicationRecord
  belongs_to :catch
  belongs_to :user
  has_many :items, dependent: :destroy
end
