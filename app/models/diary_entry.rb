class DiaryEntry < ActiveRecord::Base
	
    attr_accessible :title, :description, :mood

  validates :title,  presence: true, uniqueness: true
  validates :description,  presence: true
  validates :mood, :inclusion => %w(Happy Coy Bashful Spritely Other) #%w turns things into an array of words
  validate :must_be_monday_or_thursday_and_happy #for custom use validate (singular )

    def must_be_monday_or_thursday_and_happy
      if !((Time.now.monday?||Time.now.thursday?) and mood == "Happy")
        errors[:mood] << "Must be happy."
      end

    end

	def happy? #Looks through one specific 'page' or diary entry - this is an instances method
      mood == "happy" || mood == "joyful"

    end

    def color
    	mood == "happy"
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
