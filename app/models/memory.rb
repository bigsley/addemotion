class Memory < ActiveRecord::Base
  validates :mood, :presence => true
  validates :stress, :presence => true
  belongs_to :user
end
