class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
  @user = User.new(params[:user])
    respond_to do |format|
          if @user.save
            format.html { redirect_to(@user, :notice => 'Signup was successfully created.') }
            format.xml  { render :xml => @user, :status => :created, :location => @user }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
          end
        end
end
  def show
     @user =User.find(params[:id])
# raise @user.inspect
     respond_to do |format|
       format.html #show.html.erb
       format.xml  { render :xml => @user }
     end
   end
end
