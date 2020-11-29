class Fish < ApplicationRecord
  mount_uploader :image, FishpicUploader
end
