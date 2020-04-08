require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:like) { FactoryBot.create(:like) }
  let!(:alice) { like.user } 
  let!(:bob_blog) { like.blog } 

  it "内容があれば有効な状態であること" do
    expect(like).to be_valid
  end

  it "user_idがなければ無効な状態であること" do
    blog = FactoryBot.build(:like, user_id: nil)
    blog.valid?
    expect(blog.errors[:user_id]).to include(I18n.t('errors.messages.blank'))
  end

  it "blog_idがなければ無効な状態であること" do
    blog = FactoryBot.build(:like, blog_id: nil)
    blog.valid?
    expect(blog.errors[:blog_id]).to include(I18n.t('errors.messages.blank'))
  end

  it 'blogとuserが関連付けられていること' do
    expect(alice.like_blogs).to include(bob_blog)
    expect(bob_blog.like_users).to include(alice)
  end

  it 'user削除時に関連付けられたlikeが削除されること' do
    expect{ alice.destroy }.to change{ Like.count }.by(-1)
  end
  
  it 'blog削除時に関連付けられたlikeが削除されること' do
    expect{ bob_blog.destroy }.to change{ Like.count }.by(-1)
  end
end

