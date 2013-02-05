class DiaryEntry < ActiveRecord::Base
	attr_accessible :title, :description, :mood

	def happy? #Looks through one specific 'page' or diary entry - this is an instances method
      mood == "happy" && "joyful"
    end

    def joyful? #Looks through one specific 'page' or diary entry - this is an instances method
      mood == "joyful"
    end

    def self.by_title(title) #looks through the whole book
    	where(title: title)
    end

    def self.happy
    	where(mood: ['happy', 'joyful', 'silly'])
    end
end
