require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it "is not valid unless it has an unique name" do
    user = User.create(email: 'test@test.com', password: 'test121')
    Restaurant.create(name: "Moe's Tavern", user_id: user.id)

    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

  describe 'reviews' do
    describe 'build_with_user' do
      let(:user) { User.create email: 'test@test.com', password: 'test121' }
      let(:restaurant) { Restaurant.create name: 'Test' }
      let(:review_params) { {rating: 5, thoughts: 'yum'} }

      subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

      it 'builds a review' do
       expect(review).to be_a Review
      end

      it 'builds a review associated with the specified user' do
        expect(review.user).to eq user
      end
    end
  end

  describe "average rating" do

    describe "reviews" do
      let(:user) { User.create email: 'test@test.com', password: 'test121' }
      it "returns N/A when there are no reviews" do
        restaurant = Restaurant.create(name: 'The Ivy', user_id: user.id)
        expect(restaurant.average_rating).to eq 'N/A'
      end

      it "returns that rating when there's one rating" do
        restaurant = Restaurant.create(name: 'The Ivy', user_id: user.id)
        restaurant.reviews.create(rating: 4)
        expect(restaurant.average_rating).to eq 4
      end
    end
  end

end
