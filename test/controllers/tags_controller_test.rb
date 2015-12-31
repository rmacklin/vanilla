require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  setup do
    @images = []
    @images << create_image('http://foo.com', 'tag1, tag2')
    @images << create_image('http://bar.com', 'tag2')
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_select '.tag_list li', @images.size
  end

  test 'should not show invalid tag' do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, name: 'foo'
    end
  end

  test 'should show tag' do
    get :show, name: 'tag1'
    assert_response :success
    assert_select '.card', 1
  end

  private

  def create_image(url, tag_string)
    Image.create!(url: url, tag_list: tag_string)
  end
end
