class CreateMice < ActiveRecord::Migration
  def change
    create_table :mice do |t|
      t.integer :height

      t.timestamps
    end
  end
end
