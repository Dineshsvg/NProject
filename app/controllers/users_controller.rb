class UsersController < ApplicationController
require 'date'
before_filter :before_login
 def before_login
      flash[:notice] = "before filter"
 end

  def home
  end
  def home2
  end
  def new
    @user=User.new
  end
  def create
    @user=User.new(params[:user])
    name = User.find_user_name(params[:user])
#raise name.inspect
  if name.blank?
      @user.save
     flash[:message] = "Successfully created."
#      redirect_to @user
redirect_to :action=>'signin'

  else
     flash[:message] = "User name already exist."
     render 'new'
  end
  end
  def show
     @user =User.find(params[:id])

   end
  def list 
#raise list.inspect
   @users =User.all

  end
  def edit
   @user=User.find(params[:id])
  end
  def update
   @user = User.find(params[:id])
     @user.update_attributes(params[:user])
      redirect_to @user
  end
 def destroy
  @user= User.find(params[:id])
 @user.destroy
#redirect_to root_path 

redirect_to :action=>'list'
 end 
 def signin
    @u=User.all
    @arru1=Array.new
    un1=User.select(:user_name)
    @arru1.push(un1)

     @arrp1=Array.new
    ps1=User.select(:user_password)
    @arrp1.push(ps1)


 end
def check
end
def signout
#raise session[:user].inspect
session[:user].clear
redirect_to :action=>'signin'
end

end
