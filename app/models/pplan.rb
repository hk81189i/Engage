class Pplan < ActiveRecord::Base
  # validates :amount, numericality: { only_integer: true, :message => "must be a valid date/time"}
  belongs_to :user
  belongs_to :contact
  belongs_to :sale
  belongs_to :batch
  has_many :temps
  belongs_to :invoice


  def self.pp_month_rm(pm, rm)
    where("MONTH(paying_date) = ?" , pm).where("MONTH(saledate) = ?" , rm).sum :amount
  end

  def self.npp(year, month)
    @a= Pplan.where("YEAR(saledate) = ?" ,year).where("MONTH(saledate) = ?" , month).sum :amount

    @totalrevenue = Sale.where("YEAR(saledate) = ?" ,year).where("MONTH(saledate) = ?" , month).sum :selling_price

    @collected = Collection.joins(:sale).where("YEAR(sales.saledate) = ?", year).where("MONTH(sales.saledate) = ?" , month).sum :amount

    @npp = @totalrevenue -  @a 
    puts(" npp  is #@npp")
    return @npp 

  end


  def self.totalsale(month, year)
    Sale.where("MONTH(saledate) = ?" , month).where("YEAR(saledate) = ?" , year).count
  end




  def self.npp_cum
    @a = Pplan.where(saledate: (Time.now.midnight - 1.year)..Time.now.midnight+1.month).sum :amount
    puts("#@a")
    @revenue = Sale.where(saledate: (Time.now.midnight - 1.year)..Time.now.midnight+1.month).sum :selling_price
    puts("#@revenue")
        @npp_cum = @revenue-(@a)
    return (@npp_cum)
  end

  #  def

  def self.exp_cc(month)
    where("MONTH(paying_date) = ?" , month).sum :amount
  end


  def self.ubr(batch, month)
    @amountinpplanforbatch = Pplan.joins(:batch).where(batches: {name: 'Mumbai NOV'}).sum :amount
    @revenueforbatch = Sale.where("MONTH(batchdate) = ?" , month).sum :selling_price
    @ubr = @revenueforbatch - @amountinpplanforbatch
  end

  def self.saledistribution(month)
    Pplan.where("MONTH(saledate) = ?" , month).sum :amount
  end

  scope :pdue, -> { joins(:sale).having('paying_date  BETWEEN ? AND ?', (Time.now.localtime - 2.week) , Time.now + 2.week).having(payment_complete: nil)}

end
