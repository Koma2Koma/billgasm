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

  def counter(is_paid)
    count = 0
    if is_paid == 'paid'
      @user.bills.each do |bill|
        count += 1 if bill.paid
      end
    elsif is_paid == 'unpaid'
      @user.bills.each do |bill|
        count += 1 unless bill.paid
      end
    end
    count
  end

  def due_within(months)
    bills = []
    if months == 1
      @user.bills.each do |bill|
        bills << bill if bill.due_at <= Time.now + (60 * 60 * 24 * 30)
      end
    elsif months == 6
      @user.bills.each do |bill|
        bills << bill if bill.due_at <= Time.now + (60 * 60 * 24 * 30 * 6)
      end
    elsif months == 12
      @user.bills.each do |bill|
        bills << bill if bill.due_at <= Time.now + (60 * 60 * 24 * 30 * 12)
      end
    end
    bills
  end


end
