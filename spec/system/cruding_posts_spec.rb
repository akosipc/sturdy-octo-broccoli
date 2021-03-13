require 'rails_helper'

RSpec.describe 'CRUDing Posts', type: :feature do
  let!(:user) { create :user }
  let!(:post) { attributes_for :post }

  before do
    sign_in(user)
    visit posts_path
  end

  it 'creates a post' do
    click_link "New Post"

    within "form" do
      fill_in "post_title", with: post[:title]
      fill_in "post_description", with: post[:description]
      uncheck('post_published')

      click_button 'Save'
    end

    expect(page).to have_content 'Successfully created a new post'
    expect(page.current_path).to eq posts_path

    within "table" do
      expect(page).to have_content post[:title]
      expect(page).to have_content post[:description][0..40]
    end
  end

  it 'doesn\'t create a post' do
    click_link "New Post"

    within "form" do
      click_button 'Save'
    end

    expect(page).to have_content "There are errors encountered"
    expect(page.current_path).to eq posts_path

    within "form" do
      expect(page).to have_content "can't be blank"
    end
  end
end
