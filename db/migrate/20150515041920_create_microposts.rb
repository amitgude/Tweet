class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :tweet, :limit => 144

      t.timestamps null: false
    end
  end
end
