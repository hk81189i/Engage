class Contactvalue < ActiveRecord::Base
belongs_to :contact
validates :data, :presence => { :message => "missing. Required feild is missed out" }

validate :data_required
validate :cdata_validate

  def data_required
    puts self.customf
    if self.required.nil?
      
    else
      if self.data.blank?
        errors.add(self.customf, " is a required feild- Cannot be blank")
        @a = self.customf + " is blank"
      end
    
    end
  puts (" it retusns#@a")
  return @a
  end


  def cdata_validate
    if customf.starts_with? 'Phone'
      if data.is_a? Numeric
        #
else
errors.add( self.customf, "Required, Has to be number and Cannot be blank")
     end
    end
 end



def self.customvalidation

if self.email == nil

end
end




end
