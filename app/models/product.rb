class Product < ApplicationRecord
  belongs_to :catch
  belongs_to :user
  has_one :item, dependent: :destroy
end
