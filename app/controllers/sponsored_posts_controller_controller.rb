class SponsoredPostsControllerController < ApplicationController
  def show
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost = SponsoredPost.new
  end

  def edit
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def create
    @sponsoredpost = SponsoredPost.new
    @sponsoredpost.title = params[:post][:title]
    @sponsoredpost.body = params[:post][:body]
    @sponsoredpost.body = params[:post][:price]
    @sponsoredpost = Topic.find(params[:topic_id])
    @sponsoredpost.topic = @topic

    if @sponsoredpost.save
      flash[:notice] = "Sponsored Post was saved."
      redirect_to [@topic, @sponsoredpost]
    else
      flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
      render :new
    end
  end

  def update
     @sponsoredpost = SponsoredPost.find(params[:id])
     @sponsoredpost.title = params[:post][:title]
     @sponsoredpost.body = params[:post][:body]
     @sponsoredpost.body = params[:post][:price]

     if @sponsoredpost.save
       flash[:notice] = "Sponsored Post was updated."
       redirect_to [@sponsoredpost.topic, @sponsoredpost]
     else
       flash.now[:alert] = "There was an error saving the sponsored post. Please try again."
       render :edit
     end
   end
end
