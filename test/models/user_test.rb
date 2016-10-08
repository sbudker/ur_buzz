require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(name: "Test Name", email: "test@test.com",
      password: "ur_buzz_pass", password_confirmation: "ur_buzz_pass")
  end

  test "initial user should be valid" do
    assert @user.valid?
  end

  test "name should not be blank" do
    @user.name = "     "
    assert_not @user.valid?
  end

  test "email should not be blank" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "name should be less than 51 chars" do
    @user.name = "s" * 51
    assert_not @user.valid?
  end

  test "email should be less than 200 chars" do
    @user.email = "e" * 201
    assert_not @user.valid?
  end

  test "valid emails should be accepted" do
    valid_emails = %w[s@example.com Boogie@f.com
      me.you@berk.erk ayy+jay@kobe.gov]

    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email.inspect} should be valid"
      #line above takes an optional custom error message
    end
  end

  test "invalid emails should be rejected" do
    invalid_emails = %w[cusin@boogi,com steph_curry.com kobe@@@bean@.com]

    invalid_emails.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end

  test "email must be unique -- no duplicates" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "emails should be saved as lower-case" do
    mixed_case = "KobeBean@BeanBryant.CoM"
    @user.email = mixed_case
    @user.save
    assert_equal mixed_case.downcase, @user.reload.email
  end

  test "password should not be blank" do
    @user.password = "  "
    assert_not @user.valid?
  end

  test "password must be longer than 6 chars" do
    @user.password = "abcd"
    assert_not @user.valid?
  end

end
