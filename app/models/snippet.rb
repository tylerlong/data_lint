class Snippet < ActiveRecord::Base
  attr_accessible :content, :format

  validates :content, presence: true
  validates :format, presence: true, format: { with: /(?:yaml|json)/ }
end