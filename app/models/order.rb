class Order < ActiveRecord::Base
  extend Enumerize

  enumerize :state, in: %i(new created send confirmed), default: :new, predicates: true

  belongs_to :user

  has_many :items, dependent: :destroy

  validates_presence_of :user, :state, :phone, :address, :name
end
