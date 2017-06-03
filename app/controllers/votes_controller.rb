class VotesController < ApplicationController
  def create
    @post = Post.find_by id: params[:post_id]
    @post.liked_by current_user
    respond_to do |format|
      format.html{redirect_to @post}
      format.js{render :vote}
    end
  end

  def destroy
    @post = Post.find_by id: params[:post_id]
    @post.disliked_by current_user
    respond_to do |format|
      format.html{redirect_to @post}
      format.js{render :vote}
    end
  end
end
