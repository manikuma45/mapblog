require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:comment) { FactoryBot.create(:comment) }
  let!(:blog) { comment.blog }
  it 'blog削除時に関連付けられたcommentが削除されること' do
    expect { blog.destroy }.to change { Comment.count }.by(-1)
  end
end
