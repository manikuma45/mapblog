require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:comment) { FactoryBot.create(:comment) }
  let!(:blog) { comment.blog }
  let!(:user) { comment.user }

  it '内容があれば有効な状態であること' do
    expect(FactoryBot.create(:comment)).to be_valid
  end

  it '内容がなければ無効な状態であること' do
    comment = FactoryBot.build(:comment, content: nil)
    comment.valid?
    expect(comment.errors[:content]).to include(I18n.t('errors.messages.blank'))
  end

  it 'blog削除時に関連付けられたcommentが削除されること' do
    expect { blog.destroy }.to change { Comment.count }.by(-1)
  end
  
  it 'user削除時に関連付けられたcommentが削除されること' do
    expect { user.destroy }.to change { Comment.count }.by(-1)
  end
end
