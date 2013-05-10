require_relative '../../config/application'

class TodoController  
  HELP_MENU = <<EOF

HELP MENU

Type:
add <task description>  add a task to the end of the list
remove <task id>        delete a task
complete <task id>      complete a task
list                    show all tasks
save <file_name>        save the list to a file
sort_oustanding         lists all outstanding by creation date
sort_completed          lists all completed by completion date
sort_all                lists all by creation date
help                    display this menu
quit or exit            exit the program
EOF
  # @user = User.first

  def user
    User.first
  end

  def list
    Task.all.each { |t| TodoView.print_task(t) } 
  end

  def delete(id)
    Task.delete(id)
  end

  def add(task)
    Task.create(:task => task, :completed => false)
  end

  def complete(id)
    Task.find_by_id(id).update_attributes(:completed => true)
  end

  def outstanding_all
    current_user.tasks.where(:completed => false).order('updated_at DESC').each {|t| puts t}
  end

  def outstanding_by_list
    current_user.lists.each do |list|
      puts list.name unless list.tasks.empty?
      list.tasks.where(:completed => false).each do |t|
        puts t
      end
    end
  end

  def completed_all
    current_user.tasks.where(:completed => true).order('updated_at DESC').each { |t| puts t}
  end

  def filter(input)
    Task.joins(:tags).where('tags.tag_name' => "#{input}").each { |task| puts task }
  end

  def current_user
    User.the_current_user_method
  end

  def who_it_be
    p current_user
  end

  def log_in(input)
    if User.check_password(input) 
      User.sign_in(input) 
    else
      raise "Wrong password, hacker."
    end
  end
  
end

class TodoView

  def self.print_task(task)
    puts task
  end

end
