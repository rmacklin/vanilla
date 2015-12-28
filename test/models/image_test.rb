require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'not valid on invalid urls' do
    [nil, '', 'hello', 'a.jpg', 'http:/google.com'].each do |url|
      image = Image.new url: url
      assert_not image.valid?
      assert_equal ['is an invalid URL'], image.errors.messages[:url]
    end
  end

  test 'valid with required parameters' do
    image = Image.new url: 'http://google.com'
    assert image.valid?
  end

end
