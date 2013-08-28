
class IndexController < ApplicationController
  def index

    @ads = Ad.all

  end

  def show

    @ad = Ad.find_by_id(params[:id])
    redirect_to action: :index unless @ad

  end
end
