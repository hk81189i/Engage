class Lead < ActiveRecord::Base
  # validates :infu_id, uniqueness: true


  belongs_to :leadstatus
  scope :all_fresh, -> {where lead_status_id: 1}
  scope :all_contacting, -> {where lead_status_id: 2}
  scope :all_working, -> {where lead_status_id: 3}
  scope :all_closing, -> {where lead_status_id: 4}
  scope :all_paid, -> {where lead_status_id: 5}
  scope :all_dnd, -> {where lead_status_id: 6}

  scope :today, -> {where date: Date.today}
  scope :yesterday, -> {where date: Date.today - 1}
  scope :db_yesterday, -> {where date: Date.today - 2}

  scope :this_week, -> {where 'date  BETWEEN ? AND ?', (Time.now.localtime.last_week(:sunday) + 1.day ) , Time.now}

  scope :last_week, -> {where 'date  BETWEEN ? AND ?', (Time.now.localtime - 1.week).last_week(:sunday) , Time.now.last_week(:sunday) }

  scope :wblast_week, -> {where 'date  BETWEEN ? AND ?', (Time.now.localtime - 2.week).last_week(:sunday) , (Time.now.localtime - 1.week).last_week(:sunday) }

 scope :this_month, -> {where("MONTH(date) = ?" , Date.today.month )}

 scope :last_month, -> {where("MONTH(date) = ?" , (Date.today.month - 1) )}


  scope :cycle_period, ->(cycle) {where 'date  BETWEEN ? AND ?', (Time.now.localtime - cycle.days) , (Time.now.localtime)}
  scope :cycle_before_period, ->(cycle) {where 'date  BETWEEN ? AND ?', (Time.now.localtime - (2*cycle).days) , (Time.now.localtime - cycle.days)}
  scope :twocycles_before_period, ->(cycle) {where 'date  BETWEEN ? AND ?', (Time.now.localtime - (3*cycle).days) , (Time.now.localtime - (2*cycle).days)}

  def self.todaysleads
    today.order("owner DESC").group("owner").count
  end
  def self.yesterdaysleads
    today.order("owner DESC").group("owner").count
  end
  
  



end
