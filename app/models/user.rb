class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists

  def self.the_current_user_method
    recent_user = self.sort_by("last_sign_on DESC").first
    if Time.now - recent_user.last_sign_on > 3600
      raise "You need to sign someone in, try passing 'sign_in(<name>)'"
    else
      @user = recent_user
    end
    @user
  end

  def self.sign_in(user_name)
    user = self.find_by_name(user_name)
    user.last_sign_on = Time.now
    user.save
  end


end

