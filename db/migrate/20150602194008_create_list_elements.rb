class CreateListElements < ActiveRecord::Migration
  def change
    create_table :list_elements do |t|
      t.string  :literature
      t.integer :user_id
      t.timestamps
    end
  end
end
