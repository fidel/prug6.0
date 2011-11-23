class Snippet < ActiveRecord::Base

  validates :name, :presence => true
  validates :plain_code, :presence => true

end

