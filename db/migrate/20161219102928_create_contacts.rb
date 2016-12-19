class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.text :email
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
