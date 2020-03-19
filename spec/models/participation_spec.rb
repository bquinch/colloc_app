require 'rails_helper'

RSpec.describe Participation, type: :model do
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

  let(:basile_appart) do
    FlatUser.create!(
      user: basile,
      flat: appart
    )
  end

  let(:event) do
    Event.create!(
      title: 'Soirée raclette',
      description: "J'ai trop plein de fromages !",
      address: "À l'appart",
      date: Date.new(2000,1,1),
      time: Time.new(2000,1,1,4,20),
      flat_user: basile_appart
    )
  end

  let(:participation) do
    Participation.create!(
      flat_user: basile_appart,
      event: event
    )
  end

  let(:valid_attributes) do
    {
      flat_user: basile_appart,
      event: event
    }
  end

  it 'belongs to a flat user' do
    participation = Participation.new(valid_attributes)
    expect(participation.flat_user).to eq(basile_appart)
  end

  it 'belongs to an event' do
    participation = Participation.new(valid_attributes)
    expect(participation.event).to eq(event)
  end

  it 'should not be valid if it does not belong to a flat user and an event' do
    attributes = valid_attributes
    attributes.delete(:event)
    attributes.delete(:flat_user)
    participation = Participation.new(attributes)
    expect(participation).not_to be_valid
  end
end
