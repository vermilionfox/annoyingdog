require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:annoyingdog)
  end

  test "unsuccessful edit"  do 
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: {  name: "",
                                     email: "annoyingdog",
                                     password:               "",
                                     password_confirmation:  "" }
    assert_template 'users/edit'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end

  test "successful edit" do 
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "No-Annoying Dog-Anymore"
    email = "no-annoying-dog@anymore.com"
    patch user_path(@user), user: { name: name,
                                    email: email,
                                    password:               "" ,
                                    password_confirmation:  "" }
    assert_not flash.empty?
    assert flash[:success]
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
