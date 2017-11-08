require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
   
   def setup
       @category = Category.create(name: "sports")
       @user = User.create(username: "john", 
         email: "john@example.com", 
         password: "password",
         admin: true
       )
   end
   
   test "should get categroy index" do
       get :index
       assert_response :success
   end
   
   test "should get new" do
      session[:user_id] = @user.id
       get :new
       assert_response :success
   end
   
   test "should get show" do
       get(:show, { 'id' => @category.id }) 
       assert_response :success
   end
    
end