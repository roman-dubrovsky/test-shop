class Product::Kind < ActiveRecord::Base
  has_many :products, dependent: :destroy

  validates_presence_of :title
  validates_uniqueness_of :title
end
