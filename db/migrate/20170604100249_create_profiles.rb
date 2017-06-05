class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.datetime :birthday
      t.string :address
      t.string :phone_number
      t.text :description
      t.string :avatar
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
