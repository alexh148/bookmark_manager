feature 'Deleting bookmarks' do
  before(:each) do
    add_default_records
  end
  scenario 'User deletes specific bookmark' do
    view_bookmarks_page
    click_button 'Delete a Bookmark'
    choose 'Google'
    click_button 'Delete'
    expect(page).not_to have_link('Google')
  end
end
