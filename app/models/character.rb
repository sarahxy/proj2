class Character < ActiveRecord::Base
  belongs_to :player
  validates :name, uniqueness: true, presence: true
end
