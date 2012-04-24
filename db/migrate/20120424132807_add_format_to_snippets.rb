class AddFormatToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :format, :string
  end
end