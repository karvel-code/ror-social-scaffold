require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'elvis', email: 'elvis@gmail.com', password: 'elvis123') }
  let(:post) { Post.create(content: 'Hello! I am a newbbie here', user: user) }
  let(:post1) { Post.create(content: '') }

  context 'confirms the validity of a post' do
    it 'makes sure description is not empty' do
      expect(post.valid?).to be true
    end

    it 'ensures that content is not empty' do
      post.content = ''
      expect(post).not_to be_valid
    end

    it 'test if a post can be liked' do
      like = post.likes.create(user: user)
      expect(like.valid?).to be true
    end

    it 'test if comment can be added' do
      comment = post.comments.create(user: user, content: 'This is funny')
      expect(comment.valid?).to be true
    end
  end
end
