class Contact < ActiveRecord::Base
  
  def to_s
    "ID: #{id} Name: #{firstname} #{lastname} Email: #{email}"
  end
  
end
