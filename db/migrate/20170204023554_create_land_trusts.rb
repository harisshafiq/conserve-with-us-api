class CreateLandTrusts < ActiveRecord::Migration[5.0]
  def change
    create_table :land_trusts, id: :uuid do |t|
      t.string :name, null: false
      t.string :website
      t.timestamps
    end
  end
end
