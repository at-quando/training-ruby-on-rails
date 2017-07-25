# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string
#  email           :string
#  password_digest :string
#  name            :string
#  gender          :integer
#  birthday        :datetime
#  role            :integer          default(0)
#  avatar          :string
#  provider        :string
#  uid             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
