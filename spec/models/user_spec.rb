require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryBot.create(:user, :with_photo)

  it "has a first name" do
    expect(user.first_name).to eq("Basile")
  end

  it "has a last name" do
    expect(user.last_name).to eq("Quinchon")
  end

  it "has an email" do
    expect(user.email).to match(/\A[^@\s]+@[^@\s]+\z/)
  end

  it "has a password" do
    expect(user.password).to eq("password")
  end

  it "First and Last Name cannot be blank" do
    user.last_name = ''
    user.first_name = ''
    expect(user).not_to be_valid
  end

  it "Email and password cannot be blank" do
    user.email = ''
    user.password = ''
    expect(user).not_to be_valid
  end

  it "has a photo attached" do
    expect(user.photo.attached?).to be(true)
  end

  it "has many flats" do
    expect(user).to respond_to(:flats)
    expect(user.flats.count).to eq(0)
  end
end
