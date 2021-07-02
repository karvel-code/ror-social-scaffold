require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'creates a comment correctly' do
    user = User.new(name: 'elvis', email: 'elvis@gmail.com', password: 'elvis123')
    post = Post.create(content: 'Hello! Im a Newbbie here!', user: user)
    comment = Comment.create(user: user, post: post, content: 'Welcome!')
    expect(comment.valid?).to be true
  end

  it 'comment must have content' do
    user = User.new(name: 'leon', email: 'leon@gmail.com', password: 'leon123')
    post = Post.create(content: 'Hello!', user: user)
    comment = Comment.create(user: user, post: post)
    expect(comment.valid?).to be false
  end
end
