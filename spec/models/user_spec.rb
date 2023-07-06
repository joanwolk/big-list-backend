require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user, :last_name) }
  subject(:user_no_lastname) { build(:user) }
  subject(:user_conflict) { build(:user) }

  it 'successfully creates a user' do
    expect(user.save).to be_truthy
  end

  it 'successfully creates a user with no last name' do
    expect(user_no_lastname.save).to be_truthy
  end

  it 'requires email to be unique' do
    user_conflict.email = user.email.upcase
    expect(user.save).to be_truthy
    expect(user_conflict).to be_invalid
  end

  it 'requires email to be present' do
    expect(user).to be_valid
    user.email = ""
    expect(user).to be_invalid
  end

  it "should reject invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).to be_invalid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it 'requires first_name to be present' do
    expect(user).to be_valid
    user.first_name = ""
    expect(user).to be_invalid
  end
end
