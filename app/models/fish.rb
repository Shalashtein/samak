class Fish < ApplicationRecord
  mount_uploader :image, FishpicUploader
  has_many :catches, dependent: :destroy
end
