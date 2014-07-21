class InfusionsoftController < ApplicationController
  protect_from_forgery :only => []
  skip_before_filter  :authenticate_admin!
  skip_before_filter :only_authenticated_admins_are_welcome

  def batchshifted
    @sale = Sale.new(sale_params)
    @batch = Batch.find_by(:name => @sale.infu_batch)
    @sale = Sale.find_by(:infu_id => @sale.infu_id )
    @sale.update(:batch_id =>@batch.id, :batchdate => @batch.date.to_time)
    require 'xmlrpc/client'
    @key="693a317c912f96cca8ac329986fe7663"
    @server = XMLRPC::Client.new2("https://zh160.infusionsoft.com:443/api/xmlrpc")
    @server.call("ContactService.update",@key,@sale.infu_id, {"_uPwithNLPAttendingDate0" => @batch.date})

    render inline: "Done!"
  end



  def getbatch
    @sale = Sale.new(sale_params)
    @batch = Batch.find_by(:name => @sale.infu_batch)
    require 'xmlrpc/client'
    @key="693a317c912f96cca8ac329986fe7663"
    @server = XMLRPC::Client.new2("https://zh160.infusionsoft.com:443/api/xmlrpc")
    @server.call("ContactService.update",@key,@sale.infu_id, {"_uPwithNLPAttendingDate0" => @batch.date} )

    render inline: "Done!"

  end

  def newsale
    @sale = Sale.find_by(:email=> sale_params[:email], :product_id => sale_params[:product_id])
    if !@sale.nil?
      logger.info("Updated")
      @sale.update(sale_params)
    else
      logger.info("Not found- So New Sale")

      @sale = Sale.new(sale_params)
      puts("saledate is")
      @saledate = @sale.saledate
      if @sale.save
        puts("saledate is #@sale.saledate")
        @lead_name= @sale.fname + " " +@sale.lname
        @contact = Contact.create(:name => @lead_name, :fname =>@sale.fname, :lname => @sale.lname, :infu_id => @sale.infu_id, :email => @sale.email, :phone => @sale.phone)
        @batch = Batch.find_by(:name => @sale.infu_batch)
        @lead = Lead.find_by(:infu_id => @sale.infu_id)
        if !@lead.nil?
          @sale.update(:contact_id => @contact.id, :batch_id =>@batch.id, :batchdate => @batch.date, :leaddate => @lead.date)
          @cycle = @sale.saledate.to_time -  @sale.leaddate.to_time  # calculate and update sale cycle in seconds                               
          @sale.update(:cycle => @cycle)
        else
          @sale.update(:contact_id => @contact.id, :batch_id =>@batch.id, :batchdate => @batch.date, :cycle => "- ")
        end
        History.create(:name => "Sale Closed" , :owner => @sale.infu_owner_id, :lead => @sale.infu_id, :date => Date.today)
        #for email on sale                                                                                                                               
        @lead_name = @lead_name.to_s
        @owner_name = @sale.infu_owner_name.to_s
        @owner_email = @sale.infu_owner_email
        require 'mandrill'
        mandrill = Mandrill::API.new 'K_BSD_BCZDxpusNCmpoChQ'
        template_name = 'new_sale'
        templatedata = [{name: "name",
                          content: @owner_name }, {name: "lead_name",
                          content: @lead_name }
                       ]
        template_content = []
        message = {"from_name"=> "Treasure Hunt","recipient_metadata"=>[{"rcpt"=> @owner_email}],"important"=>true, "from_email"=>
          "registrations@soexcellence.com","subject"=>"Mark Sale details","to"=>[{"email"=> @owner_email, "name"=> @owner_name }],"merge"=>true,"global_merge_vars"=> templatedata}
        mandrill.messages.send_template template_name, template_content, message
      

        require 'xmlrpc/client'
        @key="693a317c912f96cca8ac329986fe7663"
        @server = XMLRPC::Client.new2("https://zh160.infusionsoft.com:443/api/xmlrpc")
        @server.call("ContactService.update",@key,@sale.infu_id, {"_uPwithNLPAttendingDate0" => @batch.date} )
        
      else
        logger.info("_____________")

        @lead_name= @sale.fname + " " +@sale.lname
        @lead_name = @lead_name.to_s
        @owner_name = @sale.infu_owner_name.to_s
        @email = @sale.infu_owner_email
        require 'mandrill'
        mandrill = Mandrill::API.new 'K_BSD_BCZDxpusNCmpoChQ'
        template_name = 'failed_to_save_sale'
        templatedata = [{name: "name",
                          content: @owner_name }, {name: "lead_name",
                          content: @lead_name }
                       ]

        template_content = []
        message = {"from_name"=> "Treasure Hunt","recipient_metadata"=>[{"rcpt"=> @email}],"important"=>true, "from_email"=> 
          "registrations@soexcellence.com","subject"=>"Failed to Mark Sale details","to"=>[{"email"=> @email, "name"=> @owner_name }],"merge"=>true,"global_merge_vars"=> templatedata}
        mandrill.messages.send_template template_name, template_content, message
      end


    end


    render inline: "Done!"
  end

  def sale_params
    if(@executed.nil?)
      @executed = true
      logger.debug(params[:saledate])
      a = params[:saledate]
      a = DateTime.strptime(a, '%m/%d/%Y')
      a = a.to_s
      params[:saledate] = a
      logger.info("_____________")
      logger.info(a)
      logger.info(params[:saledate])
      logger.info(params[:saledate].class)
      logger.info("____________")

      logger.debug(params[:selling_price])
      number = params[:selling_price]
      number= number.to_s
      number = number.gsub(',','').to_i
      params[:selling_price] = number
      
      logger.info(params[:selling_price])
    end
    
    params.permit(:contact_id, :fname, :infu_owner_name, :infu_owner_id, :infu_owner_email, :referal_code, :referal_id,  :email, :lname,  :batch_id,  :product_id, :infu_id, :selling_price, :inf_owner_id, :saledate, :leaddate, :owner_id,  :infu_batch, :phone, :approve, :sponsor_email )
  end


  def newlead 
    @lead = Lead.new(lead_params)
    if  @lead.save 
      History.create(:name => "New Lead" , :owner => @lead.infu_owner_id, :lead => @lead.infu_id, :date => Date.today)
      @name = @lead.fname + "  " + @lead.lname
      @lead.update(:name => @name, :date => Date.today)
    else
      @owner = Admin.find_by(:infu_id => @lead.infu_owner_id)
      @owner_name = @owner.admin_name
      @lead_name = @lead.fname + " " + @lead.lname
      @email = "harikrishnan@soexcellence.com" 
      require 'mandrill'
      mandrill = Mandrill::API.new 'K_BSD_BCZDxpusNCmpoChQ'
      template_name = 'failed_to_add_lead' 
      templatedata = [{name:"name", content: @owner_name }, {name: "lead_name", content:  @lead_name } ]
      template_content = []
      message = {"from_name"=> "Lead Master-Treasure Hunt","recipient_metadata"=>[{"rcpt"=> @email}],"important"=>true, "from_email"=> "leadmaster@soexcellence.com","subject"=>"Failed to receive lead","to"=>[{"email"=> @email, "name"=> @owner_name }],"merge"=>true,"global_merge_vars"=> templatedata}
      mandrill.messages.send_template template_name, template_content, message
    end
    render inline: "Done!"
  end

  def lead_reassign # params - infu_id, infu_owner_id, reassign =1, lead_status_id = 1
    @lead = Lead.find_by({:infu_id => lead_params[:infu_id]}) # findng the lead to update
    if @lead.update(lead_params)
      History.create(:name => "Reassigned Lead" , :owner => @lead.infu_owner_id, :lead => @lead.name, :date => Date.today)
    end
    render inline: "Done!"
  end

  def lead_status  # params - infu_id, lead_status_id 
    @lead = Lead.find_by({:infu_id => lead_params[:infu_id]}) # find the lead to update
    if @lead.update(lead_params)
      History.create(:name => "Status Changed" , :owner => @lead.infu_owner_id, :detail => @lead.lead_status_id, :date => Date.today, :lead => @lead.infu_id)
    end
    render inline: "Done!"
  end

  def lead_params
    params.permit(:infu_id, :name, :fname, :lname, :email, :infu_owner_id, :owner, :reassigned, :gacontent, :gasource, :gamedium, :gaterm, :gacampaign, :pcity, :lead_status_id)

  end

end
