require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user) { User.new(name: 'elvis', email: 'elvis@gmail.com', password: 'elvis123') }
  let(:friend) { User.new(name: 'leom', email: 'leon@gmail.com', password: 'leon123') }
  let(:friendship) { Friendship.create(user: user, friend: friend) }

  it 'creates a friendship in the right manner' do
    expect(friendship.valid?).to be true
  end

  it 'can create a friendship through user' do
    new_friendship = user.pending_friendships.build(user: user, friend: friend)
    expect(new_friendship.valid?).to be true
  end

  it 'ensures that friendship default status should be false' do
    expect(friendship.confirmed).to be nil
  end

end