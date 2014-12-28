class BillsController < ApplicationController
  before_action :set_params, [:edit, :update, :show, :delete]

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @bills = Bill.all
  end

  def delete

  end

  private

    def set_params
      @bill = Bill.find(params[:id])
    end

end
