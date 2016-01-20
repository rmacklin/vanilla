require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  setup do
    @image = images(:appfolio)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:images)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create image' do
    assert_difference('Image.count') do
      post :create, image: { url: @image.url, tag_list: 'foo' }
    end

    assert_redirected_to image_path(assigns(:image))
  end

  test 'should not show invalid image' do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, id: -1
    end
  end

  test 'should show image' do
    get :show, id: @image
    assert_response :success
  end

  test 'should not edit invalid image' do
    assert_raises ActiveRecord::RecordNotFound do
      get :edit, id: -1
    end
  end

  test 'should get edit' do
    get :edit, id: @image
    assert_response :success
  end

  test 'should not update invalid image' do
    assert_raises ActiveRecord::RecordNotFound do
      patch :update, id: -1, image: { url: @image.url }
    end
  end

  test 'should update image' do
    patch :update, id: @image, image: { url: @image.url, tag_list: 'foo' }
    assert_redirected_to image_path(assigns(:image))
  end

  test 'should not destroy invalid image' do
    assert_raises ActiveRecord::RecordNotFound do
      delete :destroy, id: -1
    end
  end

  test 'should destroy image' do
    assert_difference('Image.count', -1) do
      delete :destroy, id: @image
    end

    assert_redirected_to images_path
  end

  test 'should share image' do
    assert_difference('ActionMailer::Base.deliveries.size', 1) do
      xhr :post, :share, id: @image, share_form: {
        recipient_email: 'bob@lob.law', message: 'foo'
      }
    end

    assert_response :success

    share_email = ActionMailer::Base.deliveries.last
    assert_equal ['bob@lob.law'], share_email.to
    assert_equal 'Check out this cool image (not a virus I swear)', share_email.subject
  end

  test 'should rerender form if recipient_email is invalid' do
    assert_no_difference('ActionMailer::Base.deliveries.size') do
      xhr :post, :share, id: @image, share_form: {
        recipient_email: 'bob@lob', message: 'foo'
      }
    end

    assert_response :unprocessable_entity
    assert_includes JSON.parse(@response.body)['form_html'], 'is invalid'
  end

  test 'should respond with 404 if image to share does not exist' do
    assert_no_difference('ActionMailer::Base.deliveries.size') do
      xhr :post, :share, id: -1, share_form: {
        recipient_email: 'bob@lob.law', message: 'foo'
      }
    end

    assert_response :not_found
  end
end
