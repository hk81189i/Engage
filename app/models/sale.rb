class Sale < ActiveRecord::Base
  # validates :email, uniqueness: true
  #  validates_uniqueness_of :email # :scope => [:product_id]  , :on => :create  # deprecated in rails 3
  # validates :email, uniqueness: :scope => [:product_id], on: :create
  validates :email, :uniqueness => {:scope => :product_id, message: "Email already Exists, seems like a duplicate sale. Please Check."}, on: :create
  validates_presence_of :infu_batch, :infu_id, :selling_price, :fname, :saledate, :product_id, on: :create

  belongs_to :collection
  belongs_to :user
  belongs_to :contact
  belongs_to :product
  belongs_to :admin
  belongs_to :owner
  belongs_to :batch
  has_many :pplans
  has_many :collections
  has_many :invoices

   def full_name
     "#{fname} #{lname}"
  end

  # scopes for Financial/pplans  reports dashboard

  scope :tsr_month, ->(year, month) { where("YEAR(saledate) = ?" ,year).where("MONTH(saledate) = ?" , month).sum :selling_price}

  scope :salerecord_month, ->(month, year) { where("MONTH(saledate) = ?" ,month).where("YEAR(saledate) = ?" ,year).count}

  # scopes for Sales dashboard

  scope :last_week, -> { joins(:pplans).group("sale_id").having( 'sum(pplans.amount) = selling_price').having('saledate  BETWEEN ? AND ?', (Time.now.localtime - 1.week).last_week(:sunday) , Time.now.last_week(:sunday))}

  #  scope :last_week, -> {where 'saledate  BETWEEN ? AND ?', (Time.now.localtime - 1.week).last_week(:sunday) , Time.now.last_week(:sunday) }

  scope :this_week, -> {where 'saledate  BETWEEN ? AND ?', (Time.now.localtime.last_week(:sunday) + 1.day ) , Time.now}

  scope :yesterday, -> {where saledate: Date.today - 1}

  scope :this_month, -> {where("MONTH(saledate) = ?" , Date.today.month ).where("YEAR(saledate) = ?" , Date.today.year )}

  scope :last_month, -> {where("MONTH(saledate) = ?" , (Date.today.month - 1)).where("YEAR(saledate) = ?" , Date.today.year )}

  scope :orphan, -> {where contact_id: nil}

  def calc_cycle
    $infu_id = self.infu_id
    logger.info $infu_id
    @lead = Lead.find_by(:infu_id => @sale.infu_id)
    @cycle = self.saledate.to_time -  @lead.date.to_time
    self.update(:leaddate => @lead.date, :cycle => @cycle)
  end


  def self.cycle_pweek(infu_id)
    @arr =  Array.new
    @cycle =  Array.new
    @sale = Sale.last_week.where(:infu_owner_id => infu_id)
    @sale.each do |sale|
      @arr.push(sale.cycle)
    end
    @arr = @arr.sort
    len = (@arr.length)/2
    if len >= 3
      if len.even? 
        @cycle.push(@arr[(len - 2)],@arr[(len - 1)], @arr[(len )],@arr[(len +1)],@arr[(len + 2 )])
      else
        len = (@arr.length + 1)/2
        @cycle.push(@arr[(len - 2)], @arr[(len - 1)], @arr[(len )],@arr[(len +1)],@arr[(len + 2 )])
      end
    else
      @cycle =  @arr
    end
    return @cycle
  end


  def self.cycle_current_week(infu_id)
    @arr =  Array.new
    @cycle =  Array.new
    @sale = Sale.this_week.where(:infu_owner_id => infu_id)
    @sale.each do |sale|
      @arr.push(sale.cycle)
    end
    @arr = @arr.sort
    len = (@arr.length)/2
    if len >= 3
      if len.even? 
        @cycle.push(@arr[(len - 2)],@arr[(len - 1)], @arr[(len )],@arr[(len +1)],@arr[(len + 2 )])
      else
        len = (@arr.length + 1)/2
        @cycle.push(@arr[(len - 2)], @arr[(len - 1)], @arr[(len )],@arr[(len +1)],@arr[(len + 2 )])
      end
    else
      @cycle =  @arr
    end
    return @cycle
  end



  def self.cycle_current_month(infu_id)
    @arr =  Array.new
    @cycle =  Array.new
    @sale = Sale.this_month.where(:infu_owner_id => infu_id)
    @sale.each do |sale|
      if !sale.cycle.nil?
        @arr.push(sale.cycle)
      end
    end
    @arr = @arr.sort
    len = (@arr.length)/2
    if len >= 3
      if len.even? 
        @cycle.push(@arr[(len - 2)],@arr[(len - 1)], @arr[(len )],@arr[(len +1)],@arr[(len + 2 )])
      else
        len = (@arr.length + 1)/2
        @cycle.push(@arr[(len - 2)], @arr[(len - 1)], @arr[(len )],@arr[(len +1)],@arr[(len + 2 )])
      end
    else
      @cycle =  @arr
    end
    return @cycle
  end

  def self.cycle_previous_month(infu_id)
    @arr =  Array.new
    @cycle =  Array.new
    @sale = Sale.last_month.where(:infu_owner_id => infu_id)
    @sale.each do |sale|
      if !sale.cycle.nil?
        @arr.push(sale.cycle)
      end
    end
    @arr = @arr.sort
    len = (@arr.length)/2
    if len >= 3
      if len.even? 
        @cycle.push(@arr[(len - 2)],@arr[(len - 1)], @arr[(len )],@arr[(len +1)],@arr[(len + 2 )])
      else
        len = (@arr.length + 1)/2
        @cycle.push(@arr[(len - 2)], @arr[(len - 1)], @arr[(len )],@arr[(len +1)],@arr[(len + 2 )])
      end
    else
      @cycle =  @arr
    end
    return @cycle
  end

  # scopes for Lead/marketing dashboard

  scope :today, -> { joins(:pplans).group("sale_id").having( 'sum(pplans.amount) = selling_price').having(saledate: Date.today)}

  scope :last_week, -> { joins(:pplans).group("sale_id").having( 'sum(pplans.amount) = selling_price').having('saledate  BETWEEN ? AND ?', (Time.now.localtime - 1.week).last_week(:sunday) , Time.now.last_week(:sunday))}

  scope :wblast_week, -> {joins(:pplans).group("sale_id").having( 'sum(pplans.amount) = selling_price').having( 'saledate  BETWEEN ? AND ?', (Time.now.localtime - 2.week).last_week(:sunday) , (Time.now.localtime - 2.week).last_week(:sunday) )}

  scope :cycle_period, ->(cycle) { joins(:pplans).group("sale_id").having( 'sum(pplans.amount) = selling_price').having('saledate  BETWEEN ? AND ?', (Time.now.localtime - cycle.days) , (Time.now.localtime)) }

  scope :cycle_before_period, ->(cycle) {joins(:pplans).group("sale_id").having( 'sum(pplans.amount) = selling_price').having( 'saledate  BETWEEN ? AND ?', (Time.now.localtime - (2*cycle).days) , (Time.now.localtime - cycle.days))}

  scope :twocycles_before_period, ->(cycle) { joins(:pplans).group("sale_id").having( 'sum(pplans.amount) = selling_price').having('saledate  BETWEEN ? AND ?', (Time.now.localtime - (3*cycle).days) , (Time.now.localtime - (2*cycle).days))}



end
