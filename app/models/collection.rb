class Collection < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact
  belongs_to :sale
  belongs_to :batch
  belongs_to :invoice

  validates :amount,  presence: true
  validates :amount, numericality: true
  validates :date,  presence: true
  validates :mode,  presence: true 
  validates :payment_details, presence: true 

  scope :overdue, -> {where sale_id: nil}

  def self.in_payment_collected(month, year)
    @amount = 0
    @pplan_month = Pplan.where("MONTH(paying_date) = ?" , month).where("YEAR(paying_date) = ?" , year)
    if @pplan_month.empty?
      @amount = 0
      puts("No payment plan found")
    else
      @pplan_month.each do |pplan|
        if  Collection.where("MONTH(date) = ?" , month).where("YEAR(date) = ?" , year).where(:sale_id => pplan.sale_id).empty?
          puts("Collection empty")
          @paying_amt = 0
        else

          @paying_amt =   Collection.where("MONTH(date) = ?" , month).where("YEAR(date) = ?" , year).where(:sale_id => pplan.sale_id).sum :amount
          puts("Collection NOT empty")
        end  # end of if 
        @amount =  @amount + @paying_amt
      end # end of do
    end
    return @amount
  end


  def self.new_customers
    @newsale  = Array.new
    Sale.all.each do |sale|
      if Collection.where(:sale_id => sale.id).blank?
        @newsale_entry = Sale.where(:id =>sale.id).first
        @newsale.push(@newsale_entry)
      end

    end

    return @newsale

  end




  def self.new_customers_for_select
    new_customers = self.new_customers
    select_arr = []
    new_customers.each do |new_customer |
name = new_customer.fname.to_s   + " " + new_customer.lname.to_s
     option = [name, new_customer.id]
      select_arr.push(option)
    end
    return select_arr.sort_by{|x,y|x}

  end


  def self.old_customer_paymnet_pending_prac
    @old_sale  = Array.new
    @sale =  Sale.where(:product_id => 1)  
    @sale.each do |sale|
      @paid =  Collection.where(:sale_id => sale.id).sum :amount
      if ( Collection.where(:sale_id => sale.id) != nil  && @paid != sale.selling_price )
        @old_sale_entry = Sale.where(:id =>sale.id).first
        @old_sale.push(@old_sale_entry)
      end 

    end
    return @old_sale
    puts(@old_sale.count)
  end


  def self.old_customer_paymnet_pending_prac_for_select
    new_customers = self.old_customer_paymnet_pending_prac

    select_arr = []
    new_customers.each do |new_customer |
name = new_customer.fname.to_s   + " " + new_customer.lname.to_s
     option = [name, new_customer.id]
#      option = [new_customer.fname,new_customer.id]
      select_arr.push(option)
    end
    return select_arr.sort_by{|x,y|x}

  end


  def self.old_customer_paymnet_pending_master_prac
    @old_sale  = Array.new
    @sale =  Sale.where(:product_id => [2,3])  
    @sale.each do |sale|
      @paid =  Collection.where(:sale_id => sale.id).sum :amount
      if ( Collection.where(:sale_id => sale.id) != nil  && @paid != sale.selling_price )
        @old_sale_entry = Sale.where(:id =>sale.id).first
        @old_sale.push(@old_sale_entry)
      end 
    end
    return @old_sale
    puts(@old_sale.count)
  end

  def self.old_customer_paymnet_pending_master_prac_for_select
    new_customers = self.old_customer_paymnet_pending_master_prac

    select_arr = []
    new_customers.each do |new_customer |
name = new_customer.fname.to_s   + " " + new_customer.lname.to_s
     option = [name, new_customer.id]
#      option = [new_customer.fname,new_customer.id]
      select_arr.push(option)
    end
    return select_arr.sort_by{|x,y|x}

  end

scope :notclaimed, -> {where contact_id: nil, sale_id: nil}


end
