# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  end

  it 'username should be unique' do
    username = 'QQghjkkjhgf'
    FactoryBot.create(:user, username: username)
    u = FactoryBot.build(:user, username: username)
    u.save
    expect(u.errors.any?).to be true
  end
  it 'user_can_login' do
    user = FactoryBot.create(:user, password: '123456')
    user_data = {
      account: user.username,
      password: '123456'
    }
    expect(User.login(user_data).username).to eq user.username
  end

  it 'password would be encode at registering' do
    password = '123456'
    user = FactoryBot.create(:user, password: password)
    expect(user.password).not_to eq password
  end
end
