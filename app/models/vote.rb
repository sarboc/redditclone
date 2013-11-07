class Vote < ActiveRecord::Base
  attr_accessible :vote

  belongs_to :votable, polymorphic: true
  belongs_to :user

  validates :vote, presence: true


end
