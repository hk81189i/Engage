class FinanceMailer < ActionMailer::Base
  default from: " Collection Report <salesreporter@soexcellence.com>"


  def freport

    @subject = "Payment Collection - Today"
    # Code for checking whom the lead is assigned to on the Google spre

    @team = "Hari <harikrishnan@soexcellence.com>"  + "," + "akilan.ap@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"

    mail(:to =>@team, :subject => @subject)
  end

end

