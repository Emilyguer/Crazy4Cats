class Post < ApplicationRecord
    #Relaciones de muchos a muchos 
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    has_many :users, through: :reactions 

    enum kind: {
      like: 'like',
      dislike: 'dislike',
      not_interested: 'not_interested',
      neutral: 'neutral'
    }
  end