require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'creates a like correctly' do
    user = User.new(name: 'elvis', email: 'elvis@gmail.com', password: 'elvis123')
    post = Post.create(content: 'Hello! Iam a newbbie here!', user: user)
    like = Like.create(user: user, post: post)
    expect(like.valid?).to be true
  end
end