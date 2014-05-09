class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.references :activity, index: true
      t.references :course, index: true
      t.references :student, index: true
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
