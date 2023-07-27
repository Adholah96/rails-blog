require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'update_posts_counter' do
    let(:user) { User.create!(name: 'John', posts_counter: 0) }
    let!(:post1) { user.posts.create!(title: 'Post 1', likes_counter: 0, comments_counter: 0) }
    let!(:post2) { user.posts.create!(title: 'Post 2', likes_counter: 0, comments_counter: 0) }
  end
  it 'five recent comments' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    post = Post.create(author: user, title: 'post1', text: 'This is my first post', likes_counter: 0,
                       comments_counter: 0)
    Comment.create(author: user, post:, text: 'This is my first comment')
    Comment.create(author: user, post:, text: 'This is my second comment')
    Comment.create(author: user, post:, text: 'This is my third comment')
    Comment.create(author: user, post:, text: 'This is my fourth comment')
    Comment.create(author: user, post:, text: 'This is my fifth comment')

    expect(post.recent_comments.size).to eq(5)
    expect(post.recent_comments[0].text).to eq('This is my fifth comment')
    expect(post.recent_comments[1].text).to eq('This is my fourth comment')
  end
end
