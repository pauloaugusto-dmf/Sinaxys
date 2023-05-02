class UsersController < ApplicationController
  def show
    @candidacies = Users::Candidacies.call(current_user)
    @user = current_user
  end
end
