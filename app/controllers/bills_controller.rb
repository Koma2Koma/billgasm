class BillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_bill, only: [:edit, :update, :show, :destroy]

  def new
    @bill = @user.bills.build
  end

  def create
    @bill = @user.bills.build(bill_params)
    if @bill.save
      flash[:success] = "Bill '#{@bill.title}' created."
      # @task.user.task_total += 1
      redirect_to user_bill_path(@user, @bill)
    else
      flash[:alert] = "Failed to save bill '#{@bill.title}.'"
      render 'new'
    end
  end

  def edit

  end

  def update
    @bill.update_attributes(bill_params)
    redirect_to user_bill_path(@user, @bill)
  end

  def show
  end

  def index
    @bills = current_user.bills.all
  end

  def destroy
    if @bill.destroy
      flash[:alert] = "Bill '#{@bill.title}' destroyed."
      redirect_to user_bills_path(@user)
    else
      flash[:alert] = "Failed to delete bill '#{@bill.title}.'"
      render 'show'
    end

  end


  private

    def set_bill
      @bill = @user.bills.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    def bill_params
      params.require(:bill).permit(:title, :due_at, :amount, :paid)
    end

end
