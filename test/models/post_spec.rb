require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'should not save when title is blank' do
    post = Post.new(title: "", description: "1234567890")

    assert_not post.save
    assert_equal post.errors.full_messages.to_sentence, "Title can't be blank"
  end

  test 'should not save when description is blank' do
    post = Post.new(title: "Lego: The Movie", description: "")

    assert_not post.save
    assert_equal post.errors.full_messages.to_sentence, "Description can't be blank and Description is too short (minimum is 10 characters)"
  end

  test 'should not save when description is less than 10 characters' do
    post = Post.new(title: "Lego: The Movie", description: "123456")

    assert_not post.save
    assert_equal("Description is too short (minimum is 10 characters)", post.errors.full_messages.to_sentence)
  end

  test 'should save when everything is awesome' do
    post = Post.new(title: "Lego: The Movie", description: "This is a Lego Movie.")

    assert post.save
  end
end
