class Member < ActiveRecord::Base
#before_save :before_save_member
has_one:user
validates_presence_of :name,:dob
validates_format_of :email_id, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/, :if => Proc.new {|u| !u.email_id.blank?}
validates_uniqueness_of :phone_no

 def before_save_member
raise params.inspect
 end
end
