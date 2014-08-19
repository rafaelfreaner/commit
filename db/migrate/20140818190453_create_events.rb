class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :name
      t.text :description
      t.string :zipcode
      t.string :time
      t.string :date
      t.belongs_to :user
      t.timestamps
    end
  end
end
