class AddMarkdownToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :markdown, :text
  end
end
