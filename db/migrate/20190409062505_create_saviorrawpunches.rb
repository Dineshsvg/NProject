class CreateSaviorrawpunches < ActiveRecord::Migration
  def self.up
    create_table :saviorrawpunches do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :saviorrawpunches
  end
end
