# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  book_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Order < ApplicationRecord
	belongs_to :cart
	belongs_to :book
	scope :search_books_by_author, -> right_author { where( author: right_author) }
end
