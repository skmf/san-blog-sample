class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @article = Article.new
    end
    
    def edit
        # @article = Article.find(params[:id])
        
    end
    
    def update
        # @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] = "Article was updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
            
    end
    
    def create  
        # debugger
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        # @article.save
        # redirect_to article_path(@article)
        @article.user = current_user
        
        if @article.save
            # If we can save
            flash[:success] = "Article was created"
            redirect_to article_path(@article)
            
        else
            # if false
            render 'new'
        end
        
    end
    
    def show
        # @article = Article.find(params[:id])
    end
    
    def destroy
        # @article = Article.find(params[:id])
        @article.destroy
        flash[:danger] = "Article was successfully delted"
        redirect_to articles_path
    end
    
    private 
    def article_params
        params.require(:article).permit(:tltle, :description, category_ids: [])
    end
    
    def set_article
        @article = Article.find(params[:id])
    end
    
    def require_same_user
        if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own articles"
        redirect_to root_path
        end
    end
    
    
    
end
