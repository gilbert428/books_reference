class CreateAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :agents do |t|
      t.integer :agent_id
      t.string :name
      t.string :alias
      t.date :birth_date
      t.string :webpage

      t.timestamps
    end
  end
end
