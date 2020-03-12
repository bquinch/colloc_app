require 'rails_helper'
require 'date'
require 'time'

RSpec.describe Event, type: :model do
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
      time: Time.new(2000,1,1,4,20)
    )
  end

  let(:valid_attributes) do {
      title: 'Soirée raclette',
      description: "J'ai trop plein de fromages !",
      address: "A l'appart",
      date: Date.new(2000,1,1),
      time: Time.new(2000,1,1,4,20)
    }
  end

  it 'has a title' do
    event = Event.new(title: 'Soirée raclette')
    expect(event.title).to eq('Soirée raclette')
  end

  it 'has a description' do
    event = Event.new(description: "J'ai trop plein de fromages!")
    expect(event.description).to eq("J'ai trop plein de fromages!")
  end

  it 'has an address' do
    event = Event.new(address: "À l'appart")
    expect(event.address).to eq("À l'appart")
  end

  it 'has a date' do
    event = Event.new(date: Date.new(2000,1,1))
    expect(event.date).to eq(Date.new(2000,1,1))
  end

  it 'has a time' do
    event = Event.new(time: Time.new(2000,1,1,4,20))
    expect(event.time).to eq(Time.new(2000,1,1,4,20))
  end

  it 'title should not be blank' do
    attributes = valid_attributes
    attributes.delete(:title)
    event = Event.new(attributes)
    expect(event).not_to be_valid
  end

  it 'description should not be blank' do
    attributes = valid_attributes
    attributes.delete(:description)
    event = Event.new(attributes)
    expect(event).not_to be_valid
  end

  it 'address should not be blank' do
    attributes = valid_attributes
    attributes.delete(:address)
    event = Event.new(attributes)
    expect(event).not_to be_valid
  end

  it 'date should not be blank' do
    attributes = valid_attributes
    attributes.delete(:date)
    event = Event.new(attributes)
    expect(event).not_to be_valid
  end

  it 'time should not be blank' do
    attributes = valid_attributes
    attributes.delete(:time)
    event = Event.new(attributes)
    expect(event).not_to be_valid
  end

  it 'belongs to a user' do
    event = Event.new(flat_user: basile_appart)
    expect(event.flat_user).to eq(basile_appart)
  end

  it 'has many participants' do
    event = Event.new
    expect(event.participations.count).to eq(0)
  end
end
