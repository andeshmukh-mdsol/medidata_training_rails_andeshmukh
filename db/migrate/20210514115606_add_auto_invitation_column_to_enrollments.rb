class AddAutoInvitationColumnToEnrollments < ActiveRecord::Migration[6.1]
  def change
    add_column :enrollments, :auto_invitation, :integer
  end
end
