class CreateProjectManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_managers do |t|
      t.string :name

      t.timestamps
    end
  end
end
