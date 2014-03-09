class Datastore < ActiveRecord::Base
	attr_accessible :name
  belongs_to :service
end
