class ModifyQuestionsDescriptionColumn < ActiveRecord::Migration[5.0]
  def change
    change_column_null :questions, :description, true
  end
end
