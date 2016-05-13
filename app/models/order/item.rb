class Order::Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates_presence_of :order, :product, :count, :price
  validates :count, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than: 0 }
end
