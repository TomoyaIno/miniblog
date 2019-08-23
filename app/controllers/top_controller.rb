class TopController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy]
  before_action :move_to_index, except: :index
  
  def index
    @tweets = Tweet.order('id DESC')
  end
  
  def new
      
  end
  
  def create
    Tweet.create(title: tweet_params[:title], review: tweet_params[:review], user_id: current_user.id)
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
   def update
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.update(tweet_params)
    end
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
  
   def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
    end
  end

  private
  def tweet_params
    params.permit(:title, :review)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in? 
  end
end
