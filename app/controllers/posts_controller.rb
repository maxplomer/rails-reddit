class PostsController < ApplicationController
  before_action :require_user!, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new(:sub_id => params[:sub_id])
    render :new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to sub_post_url(@post.sub_id, @post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = current_user.posts.find(params[:id])
    render :edit
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      reassign_sub_post(@post)
      redirect_to sub_post_url(@post.sub_id, @post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :author_id)
  end

  def reassign_sub_post(post)
    sub_posts = PostSub.where(:post_id => post.id)
    sub_posts.each {|sub_post| PostSub.delete(sub_post.id)}
    cross_subs = params[:post][:cross_sub]

    return if cross_subs.nil?
    cross_subs.each do |cross_sub|
      PostSub.create!(sub_id: cross_sub, post_id: post.id)
    end
  end

end
