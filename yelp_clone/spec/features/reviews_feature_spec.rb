require 'rails_helper'

feature 'reviewing' do
  before do
    sign_up
  end


  scenario 'allows users to leave a review using a form' do
    user = User.create(email: 'test@test.com')
    kfc = user.restaurants.new(name: 'KFC', description: 'Crunchy chicken', user_id: user.id)
    kfc.save
    visit '/restaurants'
    click_link 'Review'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq "/restaurants/#{kfc.id}"
    expect(page).to have_content('so so')
  end
end
