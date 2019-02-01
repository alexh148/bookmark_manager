feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    add_default_records
    view_bookmarks_page
    expect(page).to have_link('Test-Website')
  end
end


feature 'add bookmarks' do
  scenario 'user can add a new bookmark' do
    add_default_records
    view_bookmarks_page
    click_button('Add New Bookmark')
    fill_in 'URL', with: 'http://www.facebook.com'
    fill_in 'Title', with: 'Facebook'
    click_button('Save')
    expect(page).to have_link('Facebook')
  end

  scenario 'when user tries to add an invalid bookmark' do
    view_bookmarks_page
    click_button('Add New Bookmark')
    fill_in 'URL', with: 'Some invalid URL'
    fill_in 'Title', with: 'Some invalid title'
    click_button('Save')
    expect(page).to have_content('Invalid URL entered. Please try again')

  end
end
