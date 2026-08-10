require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'should be between 1 and 420 characters long' do
    expect(Post.new(message: 'this is a valid message')).to be_valid
    expect(Post.new(message: '')).to_not be_valid
    expect(Post.new(message: 'a'*440)).to_not be_valid
  end
end
