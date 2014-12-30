module BillsHelper

  def total(is_paid)
      total = 0
      if is_paid == 'paid'
        @user.bills.each do |bill|
          total += bill.amount if bill.paid
        end
      elsif is_paid == 'unpaid'
        @user.bills.each do |bill|
          total += bill.amount unless bill.paid
        end
      end
      total
    end

end
