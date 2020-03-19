require 'rails_helper'

RSpec.describe Flat, type: :model do
  let(:basile) do
    User.create!(
      first_name: "Basile",
      last_name: "Quinchon",
      email: "basile@quinchon.com",
      password: "123456"
    )
  end

  let(:valid_attributes) do
    {
      title: 'My Flat',
      description: 'Super',
      address: '13 allée des Eiders, 75019 Paris',
      flat_code: 'ABC123A',
      user: basile
    }
  end

  it "has a title" do
    flat = Flat.new(title: 'My Flat')
    expect(flat.title).to eq("My Flat")
  end

  it "has a description" do
    flat = Flat.new(description: 'Super')
    expect(flat.description).to eq("Super")
  end

  it "has an address" do
    flat = Flat.new(address: '13 allée des Eiders, 75019 Paris')
    expect(flat.address).to eq("13 allée des Eiders, 75019 Paris")
  end

  it "has a flat code" do
    flat = Flat.new(flat_code: "ABC123A")
    expect(flat.flat_code).to eq("ABC123A")
  end

  it "Attributes cannot be blank" do
    attributes = valid_attributes
    attributes.delete(:title)
    attributes.delete(:description)
    attributes.delete(:address)
    attributes.delete(:flat_code)
    flat = Flat.new(attributes)
    expect(flat).not_to be_valid
  end

  it "has many flat users" do
    flat = Flat.new(valid_attributes)
    expect(flat).to respond_to(:flat_users)
    expect(flat.flat_users.count).to eq(0)
  end

  it "belongs to a user" do
    flat = Flat.new(valid_attributes)
    expect(flat.user).to eq(basile)
  end
end
