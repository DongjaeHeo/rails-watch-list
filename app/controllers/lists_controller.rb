class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmarks = Bookmark.where(list_id: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)

    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def params_list
    params.require(:list).permit(:name)
  end
end
