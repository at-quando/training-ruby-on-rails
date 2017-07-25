# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  author     :string
#  name       :string
#  title      :string
#  isn        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
	has_many :orders
	has_many :carts, through: :orders
	has_many :users, through: :carts
	has_many :comments
	scope :search_author, lambda {|name_author|
	joins(:orders).where("books.author like :name_author", name_author: name_author).distinct
	}
end
