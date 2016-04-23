class Order::Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates_presence_of :order, :product, :count, :price
end
