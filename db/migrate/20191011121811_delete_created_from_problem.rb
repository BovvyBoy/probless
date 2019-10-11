class DeleteCreatedFromProblem < ActiveRecord::Migration
  def change
    remove_column :problems, :created, :datetime
  end
end
