class BoardsController < ApplicationController

  def home
    @boards = Board.all
  end

  def index
    if params[:query].present?
      @boards = Board.where(category: params[:query])
    elsif params[:query].present? && params[:time_start].present? && params[:time_end].present?
      @boards = Board.where(category: params[:query])
      @boards.each do |board|
        if board.bookings.include?(:time_start => :start_date..:end_date) || board.bookings.include?(:time_end => :start_date..:end_date)
          @boards.pop(board)
        end
       end
       return @boards
    else
      @boards = Board.all
    end
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
