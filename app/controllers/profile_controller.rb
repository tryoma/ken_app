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
      render profile_edit_user_url(@user)      
    end
  end
  
  private

    def user_profile_params
      params.require(:user).permit(profile: [:birth_day])[:profile]
    end
  
  
  
  
end
