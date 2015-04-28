class Character < ActiveRecord::Base
  belongs_to :player
  has_many :beasts
  validates :name, uniqueness: true, presence: true
end
