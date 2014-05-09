class Student < ActiveRecord::Base

def complete_name
  middlename = self.middle_name != "" ? self.middle_name + " " : " "
  nickname = self.nickname != "" ? " \"" + self.nickname + "\" " : " "
  self.first_name + nickname + middlename + self.last_name
end

end
