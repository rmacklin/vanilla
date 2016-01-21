require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success

    assert_select 'form#new_user'
  end

  test 'should create a new user' do
    assert_difference 'User.count', 1 do
      post :create, user: { name:  'Example User',
                            email: 'user@example.com',
                            password:              'password',
                            password_confirmation: 'password' }
    end
    assert_redirected_to root_path
    assert_equal 'Welcome, Example User!', flash[:success]
  end

  test "should rerender new if the user can't be saved" do
    assert_no_difference 'User.count' do
      post :create, user: { name: 'foo bar',
                            email: 'foo@bar.com',
                            password: 'a',
                            password_confirmation: 'b'
                          }
    end

    assert_select 'form#new_user'
  end
end
