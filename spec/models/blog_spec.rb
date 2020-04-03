require 'rails_helper'

RSpec.describe Blog, type: :model do
  it "内容があれば有効な状態であること" do
    expect(FactoryBot.build(:blog)).to be_valid
  end

  it "内容がなければ無効な状態であること" do
    blog = FactoryBot.build(:blog, content: nil)
    blog.valid?
    expect(blog.errors[:content]).to include(I18n.t('errors.messages.blank'))
  end

  it "緯度がなければ無効な状態であること" do
    blog = FactoryBot.build(:blog, lat: nil)
    blog.valid?
    expect(blog.errors[:lat]).to include(I18n.t('errors.messages.blank'))
  end

  it "経度がなければ無効な状態であること" do
    blog = FactoryBot.build(:blog, lng: nil)
    blog.valid?
    expect(blog.errors[:lng]).to include(I18n.t('errors.messages.blank'))
  end
end