class AddVotesToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :votes, :integer
  end
end
