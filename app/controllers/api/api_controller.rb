class Api::ApiController < ApplicationController
  def report
    @posts = Post.where({author: { city: params[:city] }})

    render 'api/posts/index', locals: { posts: @posts }
  end
end