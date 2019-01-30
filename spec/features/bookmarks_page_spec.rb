feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    add_default_records
    visit '/'
    click_button('View Bookmarks')
    expect(page).to have_link('Google')
  end
end


feature 'add bookmarks' do
  scenario 'user can add a new bookmark' do
    add_default_records
    visit '/'
    click_button('View Bookmarks')
    click_button('Add New Bookmark')
    fill_in 'URL', with: 'http://www.facebook.com'
    fill_in 'Title', with: 'Facebook'
    click_button('Save')
    expect(page).to have_link('Facebook')
  end
end
