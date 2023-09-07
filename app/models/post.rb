class Post < ApplicationRecord
    #Relaciones de muchos a muchos 
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    has_many :users, through: :reactions 

    has_one_attached :photo

    paginates_per 10
    
    enum kind: {
      like: 'like',
      dislike: 'dislike',
      not_interested: 'not_interested',
      neutral: 'neutral'
    }
  end