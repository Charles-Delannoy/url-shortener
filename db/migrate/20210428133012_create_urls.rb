class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :base_url
      t.string :generated_token

      t.timestamps
    end
  end
end
