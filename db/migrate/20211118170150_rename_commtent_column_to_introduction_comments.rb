class RenameCommtentColumnToIntroductionComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :introduction_comments, :commtent, :comment
  end
end
