class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :icq_number
      t.string :skype_name
      t.boolean :by_icq
      t.boolean :by_skype
      t.boolean :by_email
      t.boolean :by_phone

      t.timestamps
    end
    add_index :contacts, :user_id
    add_index :contacts, :icq_number
    add_index :contacts, :skype_name
  end
end
