class Order < ActiveRecord::Base
  belongs_to :user

  has_many :items, dependent: :destroy

  validates_presence_of :user, :user, :phone, :address, :name
end
