require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let!(:relationship) { FactoryBot.create(:relationship) }
  let!(:alice) { relationship.follower } 
  let!(:bob) { relationship.followed } 
  it 'followerとfollowed関連付けられていること' do
    expect(alice.following).to include(bob)
    expect(bob.followers).to include(alice)
  end
  it 'follower削除時に関連付けられたrelationship削除されること' do
    expect{ alice.destroy }.to change{ Relationship.count }.by(-1)
  end
  it 'followed削除時に関連付けられたrelationship削除されること' do
    expect{ bob.destroy }.to change{ Relationship.count }.by(-1)
  end
end