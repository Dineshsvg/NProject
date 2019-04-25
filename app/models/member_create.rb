class MemberCreate < ActiveRecord::Base
 def self.create_member
  @a=0
  m = Member.new
  m.name = 'affff'#{@a}
  m.dob = Time.now
  m.phone_no =6
  m.save!
#raise m.inspect
  @a+=1
puts m
 end
end
