# require 'rails_helper'
#
# describe RestaurantsController, :type => :controller do
#
#   describe "POST create" do
#     it "assigns @" do
#       user = User.create(email: 'test@test.com')
#       restaurant = user.restaurants.new(name: 'KFC', description: 'Crunchy chicken', user_id: user.id)
#       2.times {restaurant.save}
#
#       assert_equal(2, user.restaurants.count, "Unexpected associated records count")
#     end
#
#
#   end
#
# end
#
# RSpec.describe TeamsController do
#   describe "GET index" do
#     it "assigns @teams" do
#       team = Team.create
#       get :index
#       expect(assigns(:teams)).to eq([team])
#     end
#
#     it "renders the index template" do
#       get :index
#       expect(response).to render_template("index")
#     end
#   end
# end
