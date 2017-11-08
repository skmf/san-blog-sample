require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    # --------------------------------------------------------------------------
    def setup
        @user = User.create(username: "john", 
         email: "john@example.com", 
         password: "password",
         admin: true
         )
    end
    
    
    # --------------------------------------------------------------------------
    test "get new vategory form and create category" do
        
        # 
        sign_in_as(@user, "password")
        
        # going to category path
        get new_category_path
        
        # getting new form
        assert_template 'categories/new'
        
        # posting to form with new category 
        assert_difference 'Category.count', 1 do
            post_via_redirect categories_path, category: { name: "sports" }
        end
        
        # redirest to index page
        assert_template 'categories/index'
        
        # db shoud now have sports
        assert_match "sports", response.body
         
    end
    
    #--------------------------------------------------------------------------
    test "invalid category submission result in failure" do
        
        # 
        sign_in_as(@user, "password")
   
        # going to category path
        get new_category_path
        
        # getting new form
        assert_template 'categories/new'
        
        # posting to form with new category 
        assert_no_difference 'Category.count' do
            post categories_path, category: { name: " " }
        end
        
        # redirest to index page
        assert_template 'categories/new'
        
        # 
        assert_select 'h2.panel-title'
        assert_select 'div.panel-body'
    end
    
    #--------------------------------------------------------------------------
    # test "should redirect create when admin not logged in" do
    #   assert_no_difference "Category.count" do
    #       post :create, category: { name: "sports" }
    #   end
    #   assert_redirected_to categories_path
    # end
    
end