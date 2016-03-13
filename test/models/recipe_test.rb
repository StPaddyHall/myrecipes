require 'test_helper' #required to have this for all tests

class RecipeTest < ActiveSupport::TestCase
   
   # create a recipe object and save that object to an instance variable, making
   # it available for the rest of the testing
   def setup
      @chef = Chef.create(chefname: "bob", email: "bob@example.com")
      @recipe = @chef.recipes.build(name: "chicken parm", summary: "This is the best chicken parm recipe ever",
                description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes") 
   end
   
   # first test is to check that the recipe is valid
   test "recipe should be valid" do
       assert @recipe.valid? #assert is an assertion
   end
   
   test "chef_id should be present" do
      @recipe.chef_id = nil
      assert_not @recipe.valid?
   end
   
   # failing test
   test "name should be present" do
      @recipe.name = " "
      assert_not @recipe.valid?
   end
   
   test "name length should not be too long" do
      @recipe.name = "a" * 101
      assert_not @recipe.valid?
   end
   
   test "name length should not be too short" do
      @recipe.name = "aaaa"
      assert_not @recipe.valid?
   end
   
   test "summary should be present" do
      @recipe.summary = " "
      assert_not @recipe.valid?
   end
   
   test "summary length should not be too long" do
      @recipe.summary = "a" * 151
      assert_not @recipe.valid?
   end
   
   test "summary length should not be too short" do
      @recipe.summary = "a" * 9
      assert_not @recipe.valid?
   end
   
   test "description should be present" do
      @recipe.description = " "
      assert_not @recipe.valid?
   end
   
   test "description should not be too long" do
      @recipe.description = "a" * 501
      assert_not @recipe.valid?
   end
   
   test "description should not be too short" do
      @recipe.description = "a" * 19
      assert_not @recipe.valid?
   end
   
end