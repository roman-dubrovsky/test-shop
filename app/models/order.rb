class Order < ActiveRecord::Base
  extend Enumerize

  enumerize :state, in: %i(new created send confirmed), default: :new, predicates: true

  belongs_to :user

  has_many :items, dependent: :destroy

  validates_presence_of :state, :phone, :address, :name
  validates_plausible_phone :phone, country_code: 'BY'

  def total_price
    items.map(&:price).sum
  end
end
