class DiaryEntriesController < ApplicationController
	#before_filter :get_diary_entry, :only => [:edit, :update, :destroy]

  #def get_diary_entry
   # @diary_entry = DiaryEntry.find(params[:id])
 # end


  def index
	  if params[:day] 
      @day = params[:day].to_date
    else
      @day = Date.today
    end 

    @diary_entries = DiaryEntry.where(created_at: @day.beginning_of_day..@day.end_of_day)

    
      @month_entries = DiaryEntry.where(created_at: @day.beginning_of_month..@day.end_of_month)

      @checkmark = @month_entries.map do |i|
        i.created_at.to_date
      end
    
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
      @get_tweet
    end

    def destroy
      @diary_entry = DiaryEntry.find(params[:id])
      @get_tweet
      @diary_entry.destroy

      redirect_to diary_entries_path
    end
end
