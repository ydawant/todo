require_relative 'config/application'

require File.join(APP_ROOT, 'app', 'controllers', 'todo_controller')

controller  = TodoController.new
controller.send(*ARGV)
