class CreateUserFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_files do |t|

      t.timestamps
    end
  end
end
