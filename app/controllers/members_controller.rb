class MembersController < ApplicationController
after_filter :after_login,:only => [ :list ] 

 def after_login
      flash[:notice] = "after filter"
 end
 def new
   @member = Member.new
 end
 def create
   @member = Member.new(params[:member])

#@a=Member.find_particular
#@b=Member.find_particular_method
#  name = params[:member][:photo_url]
#  directory = "public/images/upload"
#    path = File.join(directory, name)
#    File.open(path, "wb") { |f| f.write(params[:member][:photo_url]) }

   @member.save!
   flash[:notice] = "member created"
   redirect_to @member
 end
 def list
#session[:user]=params[:user][:name]
  @members=Member.all
 end
 def show
  @member = Member.find(params[:id])
 end
 def edit
   @member=Member.find(params[:id])
 end
 def update
   @member = Member.find(params[:id])
   @member.update_attributes(params[:member])
   redirect_to @member
 end
 def destroy
  @member = Member.find(params[:id])
  @member.destroy
  redirect_to 'list'
 end



# def upload_photo
#    name = params[:upload][:file].original_filename
#    directory = "public/images/upload"
#    path = File.join(directory, name)
#    File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }
#    flash[:notice] = "File uploaded"
#    redirect_to "list"
#  end

end
