require 'rails_helper'
RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John Doe',
      photo: '
https://picsum.photos/200/300',
      bio: 'Developer',
      posts_counter: 5
    )
  end
  before { subject.save }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid with a negative posts counter' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'is not valid with a non-integer posts counter' do
    subject.posts_counter = 1.5
    expect(subject).to_not be_valid
  end
  it 'three recent posts' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    Post.create(author: user, title: 'post1', text: 'This is my first post', likes_counter: 0,
                comments_counter: 0)
    Post.create(author: user, title: 'post2', text: 'This is my second post', likes_counter: 0,
                comments_counter: 0)
    Post.create(author: user, title: 'post3', text: 'This is my third post', likes_counter: 0,
                comments_counter: 0)
    Post.create(author: user, title: 'post4', text: 'This is my fourth post', likes_counter: 0,
                comments_counter: 0)

    recent_posts = user.three_recent_posts

    expect(recent_posts.size).to eq(3)
    expect(recent_posts[0].title).to eq('post4')
    expect(recent_posts[1].title).to eq('post3')
    expect(recent_posts[2].title).to eq('post2')
  end
end
