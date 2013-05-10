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

  def initialize
    puts "Enter the file name of the list you wish to load:\n"
    load(gets.chomp)
    run
  end

  def run
    puts HELP_MENU
    begin
      puts "What would you like to do?" 
      input = gets.chomp
      input = input.split
      case input[0]
      when "add" 
        task.create(input[1])
      when "remove" 
        Task.delete(input[1].to_i) 
      when "complete" 
        Task.complete(input[1].to_i)
      # when "add_tag"
      #   puts
      #   @list.add_tag(input[1].to_i, input[2..-1].join(' '))
      when "list" 
        Task.list
      # when "save"
      #   puts
      #   @list.save_to_jzyd(input[1])
      #   puts "Successfully saved to #{input[1]}"
      # when "load"
      #   puts
      #   load(input[1])
      #   puts @list
      when "help"
        puts
        puts HELP_MENU
      # when "filter"
      #   puts
      #   @list.filter(input[1])
      when "sort_outstanding"
        Task.where_not_completed_order_by_created_at
      when "sort_completed"
        Task.where_completed_order_by_updated_at
      when "sort_all"
        Task.order_by_created_at
      when "quit", "exit"
        abort "Thanks for using our To Do List!"
      else
        puts
        puts "Invalid command. Type help for the menu."
      end
    end while true
  end
end
end
