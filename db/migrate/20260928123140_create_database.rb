class CreateDatabase < ActiveRecord::Migration[8.1]
  def change
    create_table :databases do |t|
      t.timestamps
    end
  end
end
