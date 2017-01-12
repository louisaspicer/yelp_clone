require 'rails_helper'
require 'web_helper'
require 'with_user_association_extension'


feature "reviewing" do

  scenario "allows users to leave a review using a form" do
    sign_up
    create_restaurant
    leave_review("so so", "3")

    expect(current_path).to eq "/restaurants"
    expect(page).to have_content "so so"
  end

  scenario "displays an average rating for all reviews" do
    sign_up
    create_restaurant
    leave_review("So so", "3")
    leave_review("Great", "5")
    expect(page).to have_content("Average Rating: 4")
  end
end
