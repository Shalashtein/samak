class Product < ApplicationRecord
  belongs_to :catch, :class_name => 'Catch'
end
