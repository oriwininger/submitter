class CreateApplicationsAndJobs < ActiveRecord::Migration
  def self.up
    create_table :job_applications do |t|
      t.string  :name
      t.string  :status
      t.string  :portfolio
      t.string  :email
      t.string  :phone
      t.string  :location      
      
      t.timestamps
    end
  
    create_table :jobs do |t|
      t.string  :location
      t.boolean :portfolio
      t.string  :title
      t.string  :token      
      
      t.timestamps
    end
  
  end

  def self.down
    drop_table :job_applications
    drop_table :jobs
  end
end