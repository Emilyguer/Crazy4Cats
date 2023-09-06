class ReactionsController < ApplicationController
  def new_user_reaction
    @user = current_user
    @type = params[:reaction_type]
    @post = find_post_or_comment
    @kind = params[:kind]

  
    respond_to do |format|
      if @post
        if @type == "comment"
          reaction_comment = Reaction.find_by(user_id: @user.id, comment_id: @post.id)
          if reaction_comment
            format.html { redirect_to post_path(@post), notice: 'You already reacted to this comment.' }
          else
            create_reaction(@post)
            format.html { redirect_to post_path(@post), notice: 'Reaction was successfully created.' }
          end
        elsif @type == "post"
          reaction_post = Reaction.find_by(user_id: @user.id, post_id: @post.id)
          if reaction_post
            format.html { redirect_to post_path(@post), notice: 'You already reacted to this post.' }
          else
            create_reaction(reactionable)
            format.html { redirect_to post_path(@post), notice: 'Reaction was successfully created.' }
          end        
        else
          format.html { redirect_to root_path, notice: 'Invalid reaction type.' }
        end
      else
        puts "DEBUG: @post is nil"
        format.html { redirect_to root_path, notice: 'Post not found.' }
      end
    end
  end

  private

  def find_post_or_comment
    if params[:comment_id].present?
      comment = Comment.find_by(id: params[:comment_id])
      puts "DEBUG: Comment found: #{comment.inspect}"
      comment
    elsif params[:post_id].present?
      post = Post.find_by(id: params[:post_id])
      puts "DEBUG: Post found: #{post.inspect}"
      post
    else
      nil
    end
  end
  

  def create_reaction(reactionable)
    Reaction.create(user_id: @user.id, reaction_type: @type, kind: @kind, reactionable: reactionable)
  end
end