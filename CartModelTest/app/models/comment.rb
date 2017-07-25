# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string
#  image      :string
#  user_id    :integer
#  rating     :integer
#  book_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
	belongs_to :book
	belongs_to :user
end
