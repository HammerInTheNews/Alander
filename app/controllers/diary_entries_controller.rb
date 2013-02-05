class DiaryEntriesController < ApplicationController
	def index
	  @diary_entries = DiaryEntry.all
      @happy = DiaryEntry.happy.all
      

	end


end
