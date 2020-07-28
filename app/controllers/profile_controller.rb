class ProfileController < ApplicationController
  def edit
    @user = User.find(params[:id])
    @profile = @user.profile
  end
  
  def update
    @user = User.find(params[:id])
    if @user.profile.update_attributes(user_profile_params)
      flash[:success] = "プロフィール情報を更新しました。"
      redirect_to @user
    else
      render :edit   
    end
  end
  
  private

    def user_profile_params
      params.require(:user).permit(profile: [ :image_name, :birth_day, :grade, :prefecture, :dojo, :junior_high, :high, :university, :affilation, :history, :signature, :frequency ])[:profile]
    end
  
  
  
  
end
