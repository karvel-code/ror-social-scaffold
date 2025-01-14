class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    # @all_friends = current_user.friends.Posts.all
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def timeline_posts
    @timeline_posts ||= Post.all.ordered_by_most_recent.select do |post|
      post.user.friends.include?(current_user) || post.user == current_user
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
