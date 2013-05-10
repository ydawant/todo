class Task < ActiveRecord::Base

  belongs_to :list

  def to_s
    "#{id}: #{task}"
  end

  def self.list
    self.all.map { |task| task.to_s }
  end

  def self.delete(id)
    self.find_by_id(id).delete
  end

  def self.complete(id)
    self.find_by_id(id).update_attribute(:completed, true)
  end
end
