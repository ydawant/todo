class Task < ActiveRecord::Base

  belongs_to :list
  has_many :taggings
  has_many :tags, through: :taggings

  def to_s
    completed = self.completed ? "[X]" : "[ ]" 
    "#{completed} #{self.id}: #{self.task}"
  end

  def self.list
    self.all.map { |task| task.to_s }
  end

  def delete(id)
    self.class.find_by_id(*id.to_i).delete
  end
  
end
