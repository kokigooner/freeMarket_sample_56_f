class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.text :image, null: false
    end
  end
end
