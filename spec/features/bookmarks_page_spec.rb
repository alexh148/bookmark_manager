feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    visit '/'
    click_button('View Bookmarks')
    expect(page).to have_content('http://www.google.com')
  end
end
