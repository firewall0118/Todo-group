class MicropostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @microposts = @user.microposts.all
  end

  def new
    @user = User.find(params[:id])
    @micro = Micropost.new
  end

  def show
    @user = User.find(params[:user_id])
    @micro = @user.micro.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @micro = @user.micro.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @micro = @user.microposts.create(micro_params)
    if @micro.save
      redirect_to user_micropost_path(@user, @micro)
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:user_id])
    @micro = @user.microposts.update(micro_params)
    if @micro
      redirect_to user_micropost_path(@user, @micro)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @micro = @user.micro.find(params[:id])
    @micro.destroy
    redirect_to user_microposts_path(@user)
  end

  private
    def micro_params
      params.require(:micropost).permit(:content)
    end
end
