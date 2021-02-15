class PostsController < ApplicationController
    
    before_action :require_poster, only: [:edit, :update, :destroy]

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def destroy
        @post = Post.find(params[:id])
        if @post
            @post.destroy
        end
        redirect_to subs_url
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
    end
end