class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :show, :destroy]
    
    def index
        @articles = Article.all
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
            flash[:notice] = "Article was updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
            
    end
    
    def create  
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        # @article.save
        # redirect_to article_path(@article)
        
        if @article.save
            # If we can save
            flash[:notice] = "Article was created"
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
        flash[:notice] = "Article was successfully delted"
        redirect_to articles_path
    end
    
    private 
    def article_params
        params.require(:article).permit(:tltle, :description)
    end
    
    private
    def set_article
        @article = Article.find(params[:id])
    end
    
end
