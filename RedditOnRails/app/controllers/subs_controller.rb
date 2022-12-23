class SubsController < ApplicationController

    def index 
        @subs = Sub.all 
        render :index 
    end


    def new 
        @sub = Sub.new 
        render :new
    end


    def create
        @sub = Sub.new(subs_params)
        if @sub && @sub.save 
            redirect_to sub_url(@sub)
        else  
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end


    def show 
        @sub = Sub.find_by(id: params[:id])
        if @sub 
            render :show
        else  
            flash[:errors] = @sub.errors.full_messages
            redirect_to subs_url
        end
    end


    def edit 
        @sub = Sub.find_by(id: params[:id])
        if @sub 
            render :edit 
        else  
            flash.now[:errors] = @sub.errors.full_messages
            render :show
        end
    end


    def update

    end


    def subs_params 
        params.require(:subs).permit(:title, :description, :moderator_id)
    end
end
