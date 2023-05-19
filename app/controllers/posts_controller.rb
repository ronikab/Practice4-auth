class PostsController < ApplicationController

    def index
      @posts = Post.where({ "user_id" => session["user_id"] })
      @posts = Post.all
    end
  
    def new
      @post = Post.new
    end
  
    def create
      if @current_user
      @post = Post.new
      @post["body"] = params["post"]["body"]
      @post["image"] = params["post"]["image"]
      @post["user_id"] = @current_user["id"]
      @post.save
      end
      redirect_to "/posts"
    end
  
  end