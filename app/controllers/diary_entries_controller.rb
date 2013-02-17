class DiaryEntriesController < ApplicationController
	def index
	  @diary_entries = DiaryEntry.all
      @happy = DiaryEntry.happy.all
	end
    
    def new
      @diary_entry = DiaryEntry.new
    end

    def create
    	@diary_entry = DiaryEntry.new params[:diary_entry] # DiaryEntry.create - this makes new entry in model.
    	# params["diary_entry"] - takes data you just entered in a new text.

      if @diary_entry.save
    	  redirect_to diary_entries_path
      else
        render :new  #gives you the new view
      end
    end

    def edit
      @diary_entry = DiaryEntry.find(params[:id]) #this finds the current id and finds the id params
    end

    def update
      @diary_entry = DiaryEntry.find(params[:id])

      if @diary_entry.update_attributes(params[:diary_entry]) #overwrites and updates and saves, then returns "True"
        redirect_to diary_entries_path
      else
        render :edit
      end
    end

    def show

    end

    def destroy
      @diary_entry = DiaryEntry.find(params[:id])
      @diary_entry.destroy

      redirect_to diary_entries_path
    end
end
