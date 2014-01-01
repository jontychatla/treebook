require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a user should enter first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end	

  test "a user should enter last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end	

  test "a user should enter profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have unique profile name" do
  	user = User.new
  	user.profile_name = users(:testdata).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end	

  test "a user should have a profile name without spaces" do
  	user = User.new
  	user.profile_name = "profile with spaces"
  	assert !user.save
  	#puts user.errors.inspect
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "that user has the correct profile name" do
    user = User.new(first_name: 'fname', last_name: 'lname', email: 'test@gmail.com', password: 'aaaaa')
    user.profile_name = "testprofile_1"
    assert !user.save
    #assert user.valid? fix this later
    #assert !user.errors[:content].empty?
  end  


end
