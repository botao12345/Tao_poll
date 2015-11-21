class AddVoteToLinks < ActiveRecord::Migration
  def change
    add_column :links, :vote, :text
  end
end
