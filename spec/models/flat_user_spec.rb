require 'rails_helper'

RSpec.describe FlatUser, type: :model do
  let(:basile) do
    User.create!(
      first_name: "Basile",
      last_name: "Quinchon",
      email: "basile@quinchon.com",
      password: "123456"
    )
  end

  let(:appart) do
    Flat.create!(
      title: 'My Flat',
      description: 'Super',
      address: '13 allée des Eiders, 75019 Paris',
      flat_code: 'ABC123A',
      user: basile
    )
  end

  let (:basile_appart) do
    FlatUser.create!
  end

  let(:valid_attributes) do
    {
      user: basile,
      flat: appart
    }
  end

  it 'belongs to a user' do
    flat_user = FlatUser.new(user: basile)
    expect(flat_user.user).to eq(basile)
  end

  it 'belongs to a flat' do
    flat_user = FlatUser.new(flat: appart)
    expect(flat_user.flat).to eq(appart)
  end
end
