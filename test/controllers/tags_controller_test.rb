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
    image_1 = create_image('http://foo.com', 'tag4, tag2')
    image_2 = create_image('http://foo.com', 'tag2, tag3')
    image_3 = create_image('http://foo.com', 'tag4, tag3')

    get :show, name: 'tag4'
    assert_response :success

    expected_image_ids = [image_1, image_3].map { |image| image.id.to_s }
    assert_select '.card' do |elements|
      assert_equal expected_image_ids, elements.map { |element| element['data-id'] }
    end
  end

  private

  def create_image(url, tag_string)
    Image.create!(url: url, tag_list: tag_string)
  end
end
