require 'attr_encrypted'
class User < ActiveRecord::Base
attr_encrypted :user_password, :key => "Dinesh" 
attr_encrypted :user_repassword, :key => "Dinesh" 
belongs_to :member

 def self.find_user_name(usernames)
   u=usernames[:user_name]
   n=User.find(:all, :conditions=>["user_name=?",u])
  end
end
