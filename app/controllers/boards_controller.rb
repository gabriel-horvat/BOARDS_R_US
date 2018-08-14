class BoardsController < ApplicationController

  def home
    @boards = Board.all
  end

  def index
    @boards = Board.all

  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(boards_params)
    @board.user = current_user
    if @board.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update

  end

  def edit

  end

  def destroy

  end

  private

  def boards_params
    params.require(:board).permit(:name, :description, :category, :price, :location, :user_id, :photo)
  end

end
