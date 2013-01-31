class MakeDiaryEntry < ActiveRecord::Migration
  def change
  	create_table :diary_entries do |t|
  		t.string :title
  		t.text :description
  		t.string :mood

  		t.timestamps
  	end

  end
end
