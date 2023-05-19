class PostsController < ApplicationController

    def index
      @posts = Post.where({ "user_id" => session["user_id"] })
      @posts = Post.all
    end
  
    def new
      if @current_user != nil
      @post = Post.new
      else 
      flash["notice"] = "Login to post!"
      redirect_to "/login"
      end

    end
  
    def create
      if @current_user != nil
      @post = Post.new
      @post["body"] = params["post"]["body"]
      @post["image"] = params["post"]["image"]
      @post["user_id"] = @current_user["id"]
      @post.save
      
      redirect_to "/posts"
      
      else 
        flash["notice"] = "Login to post!"
        redirect_to "/login"

      end
    end
  
  end