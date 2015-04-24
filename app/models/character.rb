class Character < ActiveRecord::Base
  belongs_to :player
  has_many :Beasts
  validates :name, uniqueness: true, presence: true
end
