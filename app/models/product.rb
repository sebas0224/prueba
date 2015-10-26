class Product < ActiveRecord::Base
  validates_presence_of :name, :description
  validates :name, uniqueness: true

  belongs_to :user
end
