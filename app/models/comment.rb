class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  #Relaciones de muchos  a muchos 
  has_many :reactions, dependent: :destroy
end
