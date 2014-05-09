class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.references :course, index: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :room

      t.timestamps
    end
  end
end
