require "test_helper"

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "Dara", email:"Dara@gmail.com", 
                      password: "password", password_confirmation: "password")
  end

  test "should be valid" do
    assert @chef.valid?
    
  end
  
  test "name should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test  "should be less than 30 characters" do
    @chef.chefname = "a" * 31
    assert_not @chef.valid?
  
  end
  
  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email shouldn't be longer than 255 char" do
    @chef.email = "a" * 245 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email should accept valid format" do
    valid_emails = %w[user@example.com dara@gmail.com dsomel@yahoo.ca john@co.uk.org]
    valid_emails.each do |valids|
      @chef.email = valids
      assert @chef.valid?,"#{valids.inspect} should be valid"
    end
  end
  
  test "email should be unique and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end
  
  test "email should be lower case before hitting db" do
    mixed_email = "JohN@Example.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email
  end
  
  test "password should be present" do
    @chef.password = @chef.password_confirmation = " "
    assert_not @chef.valid?
  end
  
  test "password should be atleast 5 characters" do
  @chef.password = @chef.password_confirmation = "x" * 4
  assert_not @chef.valid?
    
  end
end
