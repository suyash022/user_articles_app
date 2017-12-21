class ArticlesController < ApplicationController
#  before_action :authenticate_user!

def index
    @user=User.find(params[:user_id])
    @articles = @user.articles.all
  end

  def show
    @user=User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
  end

  def new
    @user=User.find(params[:user_id])
    @article = @user.articles.new
  end

  def edit
    @user=User.find(params[:user_id])
    @article=@user.articles.find(params[:id])
  end

  def create
    @user=User.find(params[:user_id])
    @article = @user.articles.new(article_params)

    if @article.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])

    if @article.update(article_params)
      redirect_to action: :user
    else
      render 'edit'
      flash.now[:error] = "Could not save client"
    end
  end

  def destroy
    @user=User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    @article.destroy

    redirect_to user_articles_path
  end

  private
  def article_params
    params.require(:article).permit(:author, :title)
  end
end
