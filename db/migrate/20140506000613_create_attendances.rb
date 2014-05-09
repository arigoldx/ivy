class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :attendance_type, index: true
      t.references :lesson, index: true
      t.references :student, index: true
      t.references :course, index: true
      t.date :date

      t.timestamps
    end
  end
end
