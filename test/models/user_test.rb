require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com',
                     password: 'foobar', password_confirmation: 'foobar')
  end

  test 'should be valid' do
    assert_predicate @user, :valid?
  end

  test 'name should be present' do
    @user.name = '     '
    refute_predicate @user, :valid?
  end

  test 'email should be present' do
    @user.email = '     '
    refute_predicate @user, :valid?
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
    refute_predicate @user, :valid?
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    refute_predicate @user, :valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn)
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert_predicate @user, :valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w(user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com)
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      refute_predicate @user, :valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    refute_predicate duplicate_user, :valid?
  end

  test 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    refute_predicate @user, :valid?
  end

  test 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    refute_predicate @user, :valid?
  end
end
