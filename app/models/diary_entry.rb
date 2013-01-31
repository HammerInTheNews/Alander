class DiaryEntry < ActiveRecord::Base
	attr_accessible :title, :description, :mood
end
