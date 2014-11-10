class VotesController < ApplicationController
  def upvote
    params[:vote][:value] = 1
    Vote.create!(vote_params)
    if vote_params[:voteable_type] == "Post"
      @post = Post.find(vote_params[:voteable_id])
      redirect_to sub_url(@post.sub)
    elsif vote_params[:voteable_type] == "Comment"
      #redirect_to
    end

  end

  def downvote
    params[:vote][:value] = -1
    Vote.create!(vote_params)
    if vote_params[:voteable_type] == "Post"
      @post = Post.find(vote_params[:voteable_id])
      redirect_to sub_url(@post.sub)
    elsif vote_params[:voteable_type] == "Comment"
      #redirect_to
    end
  end

  def vote_params
    params.require(:vote).permit(
      :value,
      :voteable_id,
      :voteable_type
    )
  end
end