class CreateCoursenotes < ActiveRecord::Migration
  def change
    create_table :coursenotes do |t|
      t.references :lesson, index: true
      t.references :course, index: true
      t.text :text
      t.date :date

      t.timestamps
    end
  end
end
