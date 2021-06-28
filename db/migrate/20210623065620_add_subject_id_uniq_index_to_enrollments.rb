class AddSubjectIdUniqIndexToEnrollments < ActiveRecord::Migration[6.1]
  def up
    execute "ALTER TABLE enrollments DROP FOREIGN KEY fk_rails_130022d62b;"
    remove_index :enrollments, :subject_id
    add_index :enrollments, :subject_id, unique: true
    execute "ALTER TABLE enrollments ADD CONSTRAINT `fk_rails_130022d62b` FOREIGN KEY (subject_id) REFERENCES subjects(id);"
  end
  def down
    execute "ALTER TABLE enrollments DROP FOREIGN KEY fk_rails_130022d62b;"
    remove_index :enrollments, :subject_id
    add_index :enrollments, :subject_id, unique: false
    execute "ALTER TABLE enrollments ADD CONSTRAINT `fk_rails_130022d62b` FOREIGN KEY (subject_id) REFERENCES subjects(id);"
  end
end
