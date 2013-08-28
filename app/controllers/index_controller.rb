
class IndexController < ApplicationController
  def index

    @ads = Ad.all

  end

  def show
  end
end
