class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.string :language
      t.text :source_code

      t.timestamps
    end
  end
end
