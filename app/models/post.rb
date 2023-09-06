class Post < ApplicationRecord
    #Relaciones de muchos a muchos 
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    has_many :users, through: :reactions 
end
