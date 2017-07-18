require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  
    def setup
      @user = Chef.create!(chefname: "dara", email: "dara@gmail.com")
      @recipe = Recipe.create(name: "Sushi bowls", description: "Kinda like hungry ninja but better", chef: @chef)
      @recipe2 = @chef.recipes.build(name:"Koren Bowls", description: "Tastes like sushi")
      @recipe2.save
    end
    
    test "should get recipes index" do
      get recipes_path
      assert_response :success
    end


    test "should get recipes list" do
      get recipes_path
      assert_template 'recipes/index'
      assert_match @recipe.name, response.body
      assert_match @recipe2.name, response.body
    
    
    end
    
  # test "the truth" do
  #   assert true
  # end
end
