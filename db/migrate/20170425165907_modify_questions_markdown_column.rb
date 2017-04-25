class ModifyQuestionsMarkdownColumn < ActiveRecord::Migration[5.0]
  def change
    change_column_null :questions, :markdown, true
  end
end
