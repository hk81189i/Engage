class SalesMailer < ActionMailer::Base
  default from: " Sales Report <salesreporter@soexcellence.com>"

  def salesdashboard
@collection = Collection.overdue.limit 20

    @subject = "Sales Report " + Date.today.to_time.to_s
    # code for checking whom the lead is assigned to on the Google spreadsheet'
    session = GoogleDrive.login("leads@soexcellence.com", "djduYs&5")
    ws1 = session.spreadsheet_by_key("0AjohTKNw_a7edGpOMzhBeDJqVzJzUVhPVGNHVTJoV0E").worksheets[0]
    time = Time.new
    currentday = time.day
    @bdlist = []
    for row in 1..ws1.num_rows
      rowday = ws1[row,1].to_i
      if(currentday == rowday)
        @bdlist = ws1[row,4].split(",")
      end
    end

    @member = []
    if  !@bdlist.nil?
      @bdlist.each do |i|
        @admin = Admin.find_by(:email => i)
        @member.push(@admin.admin_name)
      end
    end

    @team = "Hari <harikrishnan@soexcellence.com>"  + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"

    mail(:to => "retailsales@soexcellence.com", :subject => @subject,  :bcc => @team)
  end

end
