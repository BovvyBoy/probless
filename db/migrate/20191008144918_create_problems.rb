class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.datetime :created
      t.datetime :deadline
      t.boolean :completed, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
