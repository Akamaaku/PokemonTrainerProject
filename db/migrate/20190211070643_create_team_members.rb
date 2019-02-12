class CreateTeamMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|
      t.string :nickname
      t.integer :position
      t.references :pokemon
      t.references :team

      t.timestamps
    end
  end
end
