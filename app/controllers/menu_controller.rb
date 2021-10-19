class MenuController < ApplicationController
  @@menu = { latte: 4.00, scone: 5.00, tea: 3.00 }

  def index
    @menu = MenuItem.all
    # render plain: "Hello"
  end

  def create
    @@menu[params[:name].to_sym] = params[:price]
    redirect_to '/menu'
  end

  def show
    @item = @@menu.find { |k, v| k == params[:item].to_sym }
    if @item.nil?
      render html: "<h5>Item not found!</h5>".html_safe, status: 404
    end
  end
end
