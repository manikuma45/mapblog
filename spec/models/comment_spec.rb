require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:comment) { FactoryBot.create(:comment) }
  let!(:blog) { comment.blog }
  let!(:user) { comment.user }
  it 'blog削除時に関連付けられたcommentが削除されること' do
    expect { blog.destroy }.to change { Comment.count }.by(-1)
  end
  it 'user削除時に関連付けられたcommentが削除されること' do
    expect { user.destroy }.to change { Comment.count }.by(-1)
  end
end
