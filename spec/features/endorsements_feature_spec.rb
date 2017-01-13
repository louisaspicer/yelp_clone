require 'rails_helper'
require './spec/helpers/web_helper'


feature 'endorsing reviews' do
  before do
    user = User.create(email: 'test2@test.com', password: 'test121')
    kfc = Restaurant.create(name: 'The Ivy', user_id: user.id)
    kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
  end

  scenario 'a user can endorse a review, which updates the review endorsment count' do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end



end
