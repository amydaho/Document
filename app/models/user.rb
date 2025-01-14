class User < ApplicationRecord
  has_many_attached :images, dependent: :destroy do |attachable|
    # la taille du fichier
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end
