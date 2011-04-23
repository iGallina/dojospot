class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = t('messages.thanks_for_signup')
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

	def edit
		@user = User.find(session[:user_id])
	end
	
	def update
		@user = User.find(params[:id])
		@user.update_attributes(params[:user])		
		if @user.save
			flash[:notice] = t('messages.profile_successfully_updated')
			redirect_to(edit_profile_path)
		else
			render :edit
		end
	end
	
	def index
		@users=User.find(:all)
	end

end
