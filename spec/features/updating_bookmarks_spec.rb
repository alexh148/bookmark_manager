feature 'Updating bookmarks' do
  scenario 'user can type over the bookmark title and url, and save' do
    add_default_records
    view_bookmarks_page
    click_button 'Update bookmarks'
    choose 'Test-Website'
    click_button 'Update'
    fill_in 'Title', with: 'Elgoog'
    fill_in 'URL', with: 'http://www.elgoog.com'
    click_button 'Save'
    expect(page).not_to have_link('Test-Website', href: 'http://www.testwebsite.com')
    expect(page).to have_link('Elgoog', href: 'http://www.elgoog.com')
  end
end
