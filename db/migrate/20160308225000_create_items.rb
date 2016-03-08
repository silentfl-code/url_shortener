class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :short_url
      t.string :long_url
      t.timestamps
    end
  end
end
