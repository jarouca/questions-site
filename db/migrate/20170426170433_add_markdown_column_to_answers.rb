class AddMarkdownColumnToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :markdown, :text
  end
end
