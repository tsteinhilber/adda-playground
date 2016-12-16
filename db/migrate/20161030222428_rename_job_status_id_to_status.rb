class RenameJobStatusIdToStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column(:jobs, :job_status_id, :status)
    change_column(:jobs, :status, :string, limit: 100)
  end
end
