class CreateMwacomments < ActiveRecord::Migration
  def change
    create_table :mwacomments do |t|
      t.text :body

      t.timestamps
    end
  end
end
