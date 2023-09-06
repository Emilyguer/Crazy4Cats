# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
 
    # Crear 100 registros en la tabla Post
    until Post.count == 100 do
        Post.create(
        description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
        when_went: Faker::Date.between(from: 10.years.ago, to: Date.today)
        )
    end
    
    # Crear 20 registros en la tabla User
    i = 0
    until User.count == 20 do
        User.create(
        email: "test#{i}@gmail.com",
        password: "asdasdasd",
        password_confirmation: "asdasdasd",
        name: Faker::Name.name
        )
        i += 1
    end
    
    # Obtener todos los registros de Post y User para su posterior uso
    posts = Post.all
    users = User.all
    
    # Crear 1000 registros en la tabla Comment
    until Comment.count == 1000 do
        Comment.create(
        content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
        post_id: posts.sample.id,
        user_id: users.sample.id
        )
    end
    
# Tipos de reacciones y tipos de publicaciones
reaction_types = %w[post comment]
kinds = Post.kinds.keys
comments = Comment.all 

# Crear 1000 registros en la tabla Reaction
until Reaction.count == 1000 do
  rel_type = reaction_types.sample
  if rel_type == "post"
    Reaction.create(
      post_id: posts.sample.id,
      user_id: users.sample.id,
      kind: kinds.sample,
      reaction_type: rel_type
    )
  else
    Reaction.create(
      comment_id: comments.sample.id,
      user_id: users.sample.id,
      kind: kinds.sample,
      reaction_type: rel_type
    )
  end
end
