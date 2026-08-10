# frozen_string_literal: true

# This controller handles CRUD operations for the Post resource.
class PostsController < ApplicationController

  # GET /posts
  # Displays a list of posts.
  def index
    posts = Post.all

    render json: posts,
           status: :ok,
           headers: {
             "Access-Control-Allow-Origin": "*"
           }
  end

  # GET /posts/:id
  # Displays a specific post.
  def show
    post = Post.find(params[:id])

    render json: post,
           status: :ok,
           headers: {
             "Access-Control-Allow-Origin": "*"
           }
  end

  # POST /posts
  # Creates a new post.
  def create
    post = Post.new(post_params)

    if post.save
      render json: post,
             status: :created,
             headers: {
               "Access-Control-Allow-Origin": "*"
             }
    else
      render json: { errors: post.errors.full_messages },
             status: :unprocessable_entity,
             headers: {
               "Access-Control-Allow-Origin": "*"
             }
    end
  end

  # PUT /posts/:id
  # Updates an existing post.
  def update
    post = Post.find(params[:id])

    if post.update(post_params)
      render json: post,
             status: :ok,
             headers: {
               "Access-Control-Allow-Origin": "*"
             }
    else
      render json: { errors: post.errors.full_messages },
             status: :unprocessable_entity,
             headers: {
               "Access-Control-Allow-Origin": "*"
             }
    end
  end

  # DELETE /posts/:id
  # Deletes a specific post.
  def destroy
    post = Post.find(params[:id])
    post.destroy

    head :no_content,
         headers: {
           "Access-Control-Allow-Origin": "*"
         }
  end

  private

  def post_params
    params.require(:post).permit(:message, :views)
  end
end
