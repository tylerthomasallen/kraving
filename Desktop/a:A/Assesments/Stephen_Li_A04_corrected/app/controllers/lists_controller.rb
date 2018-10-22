class ListsController < ApplicationController
  before_action :require_login

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to list_url(@list)
    else
      flash.now[:errors] = @list.errors.full_messages
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = current_user.lists.find(params[:id])
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to list_url(@list)
    else
      flash.now[:errors] = @list.errors.full_messages
      render :edit
    end
  end

  def list_params
    params.require(:list).permit(:name, :description)
  end

end
