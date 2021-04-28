class LetUserBeNullForUrls < ActiveRecord::Migration[6.0]
  def change
    remove_reference :urls, :user, foreign_key: true
    add_reference :urls, :user, foreign_key: true
  end
end
