class CategoriesController < ApplicationController
    
    def index
        # have to change to pagination if using pagination
        # @categories = Category.all
        @categories = Category.paginate(page: params[:page], per_page: 5)

        
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        
        if @category.save
            flash[:success] = "Category was created successfully"
            redirect_to categories_path
        else
            render 'new'
        end
        
    end
    
    def show
        
    end
    
    # any method written below private will be only accessible within the controller
    private
    def category_params
        params.require(:category).permit(:name)
    end
    
end

