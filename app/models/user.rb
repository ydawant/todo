class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists

  def self.the_current_user_method
    recent_user = self.all.sort_by { |user| user.last_log_in }.reverse.first
    if (Time.now - recent_user.last_log_in)/10000000 > 3600.0
      raise "You need to sign someone in, try passing 'sign_in(<name>)'"
    else
      @user = recent_user
    end
    @user
  end

  def self.sign_in(user_name)
    user = self.find_by_name(user_name)
    user.last_log_in = Time.now
    user.save
  end

  def self.check_password(user)
    user_to_verify = self.find_by_name(user)
    puts "Enter your password: "
    password = $stdin.gets.chomp
    Base64.decode64(user_to_verify.password) == password

  end

end

