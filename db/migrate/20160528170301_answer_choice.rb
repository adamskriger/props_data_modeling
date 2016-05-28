class AnswerChoice < ActiveRecord::Migration
  def change
    add_reference :users, :answer, index: true, foreign_key: true

  end
end
