class ReactionsController < ApplicationController
  def new_user_reaction
    @user = current_user
    @type = params[:reaction_type]
    @post = find_post_or_comment
    @kind = params[:kind]

    respond_to do |format|
      if @reactionable
        if @type == "comment"
          reaction_comment = Reaction.find_by(user_id: @user.id, comment_id: @reactionable.id)
          if reaction_comment
            format.html { redirect_to post_path(@reactionable), flash["notice"] = 'You already reacted to this comment.' }
          else
            create_reaction(@reactionable) # Pasa @reactionable como reactionable para comentarios
            format.html { flash["notice"] = 'Reaction was successfully created.' }
          end
        elsif @type == "post"
          reaction_post = Reaction.find_by(user_id: @user.id, post_id: @reactionable.id)
          if reaction_post
            format.html { redirect_to post_path(@reactionable), flash["notice"] = 'You already reacted to this post.' }
          else
            create_reaction(@reactionable) # Pasa @reactionable como reactionable para publicaciones
            format.html { flash["notice"] = 'Reaction was successfully created.' }
          end
        else
          format.html { redirect_to root_path, flash["notice"] = 'Invalid reaction type.' }
        end
      else
        format.html { redirect_to root_path, flash["notice"] = 'Post not found.' }
      end
    end
  end
    
  private

  def find_post_or_comment
    if params[:comment_id].present?
      Comment.find_by(id: params[:comment_id])
    elsif params[:post_id].present?
      Post.find_by(id: params[:post_id])
    else
      nil
    end
  end

  def create_reaction(reactionable)
    @reaction = Reaction.new(
      user_id: @user.id,
      reaction_type: @type,
      kind: @kind,
      reactionable: reactionable
    )

    respond_to do |format|
      if @reaction.save
        format.html { redirect_to post_path(reactionable), notice: 'Reaction was successfully created.' }
      else
        format.html { redirect_to post_path(reactionable), alert: 'Failed to create reaction.' }
      end
    end
  end
end
