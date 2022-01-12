require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
  before :each do
    
    @user = User.create!(
      first_name: 'Ayo',
      last_name: 'Show',
      email: 'ayos@gmail.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  scenario "should be able to login successfully and are taken to the home page" do

    visit login_path

    save_screenshot('test4a.png')

    within('form') do
      fill_in 'email', with: 'ayos@gmail.com'
      fill_in 'password', with: '123456'
    end

    click_button('Submit')

    sleep(2)
    save_screenshot('test4b.png')

    expect(page).to have_text('Signed in as Ayo')

  end


end
