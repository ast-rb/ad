
class IndexController < ApplicationController
  def index

    #@ads = Ad.where('ID > 1').page(params[:page]).per_page(5)
    @ads = Ad.order('created_at ASC').page(params[:page]).per_page(5)

  end

  def show

    @ad = Ad.find_by_id(params[:id])
    redirect_to action: :index unless @ad

  end
end
