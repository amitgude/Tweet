class MicropostsController < ApplicationController
  before_action :find_tweet, :only => [:edit, :destroy, :update, :show]
  before_action :user_signed_in!
  def index
    @micropost = current_user.microposts.build
    @microposts = Micropost.all.order("created_at DESC")
  end

  def show
  end

  def create
    @micropost = current_user.microposts.create!(tweet_params)

      respond_to do |format|

        format.html { redirect_to root_path }
        format.js {}
      end
  end

  def edit
  end

  def update
    if @micropost.update(tweet_params)
      redirect_to root_path
    end
  end

  def destroy
    @micropost.destroy
    respond_to do |format|

      format.html { redirect_to root_path }
      format.js {}
    end
  end


 private
  def find_tweet
    @micropost = Micropost.find(params[:id])
  end

  def tweet_params
    params.require(:micropost).permit(:tweet)
  end


  def user_signed_in!
    if current_user.nil?
      redirect_to access_index_path
    end
  end

end
