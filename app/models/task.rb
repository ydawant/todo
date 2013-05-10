class Task < ActiveRecord::Base

  belongs_to :list

  def to_s
    if completed
      puts "[X] #{id}: #{task}"
    else
      puts "[ ] #{id}: #{task}"
    end
  end

  def self.list
    self.all.map { |task| task.to_s }
  end

  def delete(id)
    self.class.find_by_id(*id.to_i).delete
    reindex
  end

  def self.add(task)
    self.create(:task => task[0], :completed => false)
    list
  end

  def self.complete(id)
    self.find_by_id(id).update_attribute(:completed, true)
    list
  end 
end
