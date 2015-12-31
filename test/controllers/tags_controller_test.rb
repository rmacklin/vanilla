require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:tags)
  end

  test 'should not show invalid tag' do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, name: 'foo'
    end
  end

  test 'should show tag' do
    create_image('http://foo.com', 'tag1, tag2')

    get :show, name: 'tag1'
    assert_response :success
  end

  private

  def create_image(url, tag_string)
    Image.create(url: url, tag_list: tag_string)
  end
end
