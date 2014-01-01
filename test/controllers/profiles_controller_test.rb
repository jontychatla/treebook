require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:testdata).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: 'not existing'
  	assert_response :not_found
  end

  test "variables are assigned on success" do
  	get :show, id: users(:testdata).profile_name

  	assert assigns(:user) #To check if the user variable exists
  	assert_not_empty assigns(:statuses)
  end	

	
end
