# require 'rails_helper'

# RSpec.describe "Blogs", type: :system do
#   before do
#     driven_by(:rack_test)
#   end
#   describe 'blog登録、一覧、詳細、削除', js: true do
#     context '入力してボタンを押すと一覧の表示、詳細ボタンを押して詳細表示、削除を押して削除される' do
#       it '保存されたblogがblog一覧に表示、詳細表示、削除ができる' do
#         blog = FactoryBot.create(:blog)
#         visit home_path
#         expect(page).to have_content('MyText')
#         expect(page).to have_link('New Blog')

#         click_link 'New Blog'
#         # get :new, format: :js
#         # post new_blog_path, xhr: true
#         # xhr :post, new_blog_path
#         # get :new, xhr: true
        
#         # expect(page).to have_link('Back')
#       end
#     end
#   end
# end
