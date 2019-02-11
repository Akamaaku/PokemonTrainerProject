class CreateElementTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :element_types do |t|
      t.string :typeName

      t.timestamps
    end
  end
end
