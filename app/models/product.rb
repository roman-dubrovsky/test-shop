class Product < ActiveRecord::Base
  belongs_to :kind

  validates_presence_of :title, :price, :kind
  validates_uniqueness_of :title

  mount_uploader :image, ImageUploader
end
