class ChangeDatatypeCompleted < ActiveRecord::Migration
  def change
    change_column :problems, :completed, :string
  end
end
