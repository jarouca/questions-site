class ModifyAnswersBodyColumn < ActiveRecord::Migration[5.0]
  def change
    change_column_null :answers, :body, true
  end
end
