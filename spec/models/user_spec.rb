# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it '内容があれば有効な状態であること' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it 'メールアドレスがなければ無効な状態であること' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
  end

  it 'パスワードがなければ無効な状態であること' do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include(I18n.t('errors.messages.blank'))
  end

  it '名前がなければ無効な状態であること' do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
  end

  it 'user削除時に関連付けられたblogが削除されること' do
    blog = FactoryBot.create(:blog)
    user = blog.user
    expect { user.destroy }.to change { Blog.count }.by(-1)
  end
end
