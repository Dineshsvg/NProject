class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
    t.string :name
    t.string :father_name
    t.date :dob
    t.string :qualification
    t.string :position
    t.string :photo_url
    t.string :email_id
    t.integer :phone_no
    t.integer :whatsApp_no
    

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
