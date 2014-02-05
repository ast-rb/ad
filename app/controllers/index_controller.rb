class IndexController < ApplicationController
  def index

    #@ads = Ad.where('ID > 1').page(params[:page]).per_page(5)
    #@ads = Ad.order('created_at ASC').page(params[:page]).per_page(5)

    @search = Ad.with_type.ransack(params[:q])
    @ads = @search.result.order('created_at DESC').where('state = ?', 'published')
    @ads = @ads.page(params[:page]).per_page(5) #unless params["commit"] = "search"

    @search.build_condition if @search.conditions.empty?
    @search.build_sort if @search.sorts.empty?

  end

  def show
    @ad = Ad.find_by_id(params[:id])
  end
end
