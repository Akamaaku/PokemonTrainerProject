class AddColumnToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :detailsURL, :string
  end
end
