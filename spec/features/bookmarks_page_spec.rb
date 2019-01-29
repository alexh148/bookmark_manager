feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    visit '/'
    click_button('View Bookmarks')
    expect(page).to have_content('http://www.google.com')
  end

  scenario 'user can add a new bookmark' do
    visit '/'
    click_button('View Bookmarks')
    click_button('Add New Bookmark')
    fill_in 'URL', with: 'http://www.facebook.com'
    click_button('Save')
    expect(page).to have_content('http://www.facebook.com')
  end

end
