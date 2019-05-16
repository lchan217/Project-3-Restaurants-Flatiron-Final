class Location < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :restaurant, optional: true

  validates_presence_of :state, { message: "State can't be blank"}


end
