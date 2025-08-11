# frozen_string_literal: true

# This controller handles the display of posts.
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
end
