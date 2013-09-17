require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create vote" do
    assert_difference 'Vote.count' do
      v = Vote.new
      v.grade = 1
      v.save
    end
  end

  test "destroy user nullifies votes" do
    users(:peter).destroy
    assert_equal 0, User.count
    assert_equal 2, Vote.count
    assert_equal 2, Vote.where("user_id IS ?", nil).count
  end

  test "company is set correct" do
    assert_equal users(:peter).company, votes(:good_vote).company
  end

end
