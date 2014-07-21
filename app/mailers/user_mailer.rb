
class UserMailer < ActionMailer::Base
  default from: " Mrs.Sankari B <registration@soexcellence.com>"

  def salesdashboard
    @subject = "Sales report " + Date.today.to_time.to_s

    mail(:to => "alex.ramaiah@soexcellence.com", :subject => @subject,  :bcc => "Hari <harikrishnan@soexcellence.com>")
  end


  def prac_finvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end

    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"

    mail(:to => @customer, :subject => "Thank you for Registrating for the uPwithNLP Program  - Action Required", :cc => @team )


  end



  def prac_sinvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end
    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"

    mail(:to => @customer,  :subject => "Thank you for your Payment for the uPwithNLP Program", :cc => @team )

  end


  def prac_linvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end

    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"

    mail(:to => @customer,  :subject => "Thank you for your Payment for the uPwithNLP Program",  :bcc => "Hari <harikrishnan@soexcellence.com>" , :cc => @team)

  end





  def mprac_finvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end

    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"


    mail(:to => @customer,  :subject => "Thank you for Registrating for the uPwithNLP SuperMasters Program  - Action Required",  :bcc => "Hari <harikrishnan@soexcellence.com>" , :cc => @team )

  end


  def mprac_sinvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end

    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"

    mail(:to => @customer,  :subject => "Thank you for your Payment for the uPwithNLP SuperMasters Program",  :bcc => "Hari <harikrishnan@soexcellence.com>" , :cc => @team )

  end




  def mprac_linvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end
    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"


    mail(:to => @customer,  :subject => "Thank you for your Payment for the uPwithNLP SuperMasters Program",  :bcc => "Hari <harikrishnan@soexcellence.com>" , :cc => @team )

  end



  def combo_finvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end

    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"


    mail(:to => @customer,  :subject => "Thank you for Registrating for the uPwithNLP Program  - Action Required",  :bcc => "Hari <harikrishnan@soexcellence.com>" , :cc => @team )
  end

  def combo_sinvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end
    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"

    mail(:to => @customer,  :subject => "Thank you for your Payment for the uPwithNLP Program",  :bcc => "Hari <harikrishnan@soexcellence.com>" , :cc => @team )

  end



  def combo_linvoice(invoice)
    @invoice = invoice
    @sale = Sale.find(@invoice.sale_id) 
    @pplan_now = Pplan.where(:sale_id => @invoice.sale_id)  
    @total_pplan = @pplan_now.sum :amount 

    @collection_now = Collection.where(:sale_id => @invoice.sale_id)  
    @total_collection = @collection_now.sum :amount 

    if @sale.sponsor_email.blank?
      @customer = @sale.email
    else
      @customer = @sale.sponsor_email
    end
    @team = @sale.infu_owner_email.to_s + "," + "sankari.b@soexcellence.com" + "," + "gowri.ramachandran@soexcellence.com"



    mail(:to => @customer,  :subject => "Thank you for your Payment for the uPwithNLP Program",  :bcc => "Hari <harikrishnan@soexcellence.com>" , :cc => @team )

  end



end
