class HomeController < ApplicationController
  skip_before_action :authenticate_parent!, only: [:index, :contact]

  def index
    if params[:school_address]
      school = School.find_by(address: params[:school_address])
      if school != nil
        redirect_to school
      else
        redirect_to new_school_path, notice: "Cette école n'existe pas encore dans notre database, mais vous pouvez la créer! "
      end
    end
  end

  def contact
  end

end
