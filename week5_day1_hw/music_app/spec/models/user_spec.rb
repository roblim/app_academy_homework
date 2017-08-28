require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email: 'test@test.com', password: 'password') }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it 'checks if provided password matches password_digest' do
    expect(user.is_password?('password')).to be(true)
  end

  it 'resets session token' do
    old_token = user.session_token
    user.reset_session_token!
    expect(user.session_token).to_not eq(old_token)
  end

  it 'finds user by credentials' do
    user.save
    expect(User.find_by_credentials('test@test.com', 'password')).to eq(user)
  end
end
