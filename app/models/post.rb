class Post < ApplicationRecord
    #Relaciones de muchos a muchos 
    has_many :comments, dependent: :destroy
    has_many :reactions, dependent: :destroy
    has_many :users, through: :reactions 

        Kinds = %w[like dislike not_interested neutral].freeze
        KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta",
        "not_interested" => "No me interesa", "neutral" => "Neutral"}.freeze
end
