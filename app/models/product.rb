class Product < ActiveRecord::Base
  belongs_to :kind

  has_many :items, class_name: "Order::Item", dependent: :destroy

  validates_presence_of :title, :price, :kind
  validates_uniqueness_of :title
  validates :price, numericality: { greater_than: 0 }

  mount_uploader :image, ImageUploader
end
