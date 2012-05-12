class PagesController < ApplicationController
  def index
    if authenticated?
      return redirect_to new_anniversary_path
    end
  end

  def help
  end
end
