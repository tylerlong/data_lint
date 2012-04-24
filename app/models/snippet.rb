class Snippet < ActiveRecord::Base
  attr_accessible :content, :valid

  validates :content, presence: true
end