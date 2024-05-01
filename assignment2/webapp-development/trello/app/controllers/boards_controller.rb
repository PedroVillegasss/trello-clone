class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def home
    @boards_limited = Board.order(created_at: :desc).limit(3)
  end

  def show
    id = params['id']
    @board = Board.find(id)
  end

  def table
    @boards = Board.all
  end
end
