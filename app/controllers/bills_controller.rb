class BillsController < ApplicationController
  before_action :set_user
  before_action :set_params, only: [:edit, :update, :show, :delete]

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
    @bills = current_user.bills.all
  end

  def delete

  end

  private

    def set_bill
      @bill = @user.bills.find(params[:id])
    end

    def set_user
      @user = current_user
    end

end
