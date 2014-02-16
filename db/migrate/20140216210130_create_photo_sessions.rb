class CreatePhotoSessions < ActiveRecord::Migration
  def change
    create_table :photo_sessions do |t|
      t.string :email_address
      t.string :guid

      t.timestamps
    end
    add_attachment :photo_sessions, :photo_1
    add_attachment :photo_sessions, :photo_2
    add_attachment :photo_sessions, :photo_3
  end
end
