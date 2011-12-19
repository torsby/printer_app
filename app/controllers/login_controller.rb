class LoginController < ApplicationController
 layout "admin"
 def add_user
  if request.get?
   @user = User.new
  else
   @user = User.new(params[:user])
   if @user.save
flash[:notice] = "You have successfully logged out"
     redirect_to_index("User #{@user.name} created")
   end
 end
end
end

