require 'rails_helper'

RSpec.describe 'Users index view', type: :feature do
  describe 'Index page' do
    before(:each) do
      @user1 = User.create(name: 'Gul',
                           photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU', bio: 'Spring Sun', email: 'example1@example', posts_counter: 0)
      @user2 = User.create(name: 'Ahmad',
                           photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU', bio: 'Spring Sun', email: 'example2@example', posts_counter: 0)
      @user3 = User.create(name: 'Muzafar',
                           photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU', bio: 'Spring Sun', email: 'example3@example', posts_counter: 0)

      visit users_path
    end

    it 'Display users index content' do
      expect(page).to have_content('Gul')
      expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU']")
      expect(page).to have_content('Number of posts: 0')

      expect(page).to have_content('Ahmad')
      expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU']")
      expect(page).to have_content('Number of posts: 0')

      expect(page).to have_content('Muzafar')
      expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU']")
      expect(page).to have_content('Number of posts: 0')

      click_link('Gul')
      sleep(5)
      expect(page).to have_current_path(user_path(@user1))
    end
  end
end
