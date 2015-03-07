class BoardsController < ApplicationController
  def new
    @board = Board.new
    @board.build_product
    p @klass = params[:klass]
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to new_board_path
    else
      render :new
    end
  end

  private
  def board_params
    params.require(:board).permit(:size, :year, :material, product_attributes: [:title])
  end
end
