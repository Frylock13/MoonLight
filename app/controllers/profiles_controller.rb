class ProfilesController < ApplicationController

  layout 'profile'

  def show
    @profile = current_user.profile
    get_equipment
  end
end
