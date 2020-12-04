class Product < ApplicationRecord
  belongs_to :catch
  has_many :items, dependent: :destroy
end
