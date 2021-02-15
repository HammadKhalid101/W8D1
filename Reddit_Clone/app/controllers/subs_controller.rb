class SubsController < ApplicationController

    before_action :require_logged_in 
    before_action :require_moderator, only: [:edit, :update, :destroy]

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.mod_id = current_user.id

        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def show
        @sub = Sub.find(params[:id])
        if @sub 
            render :show
        else
            redirect_to subs_url
        end
    end 

    def index
        @subs = Sub.all
        render :index
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def destroy
        @sub = Sub.find(params[:id])
        if @sub
            @sub.destroy
        end
        redirect_to subs_url
    end
    

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
