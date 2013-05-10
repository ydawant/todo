require_relative '../../config/application'

class Controller  
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

command = ARGV[0]
task = ARGV[1..-1]
  if !task.empty?
    Task.send(command, task)
  else
    Task.send(command)
  end
end
