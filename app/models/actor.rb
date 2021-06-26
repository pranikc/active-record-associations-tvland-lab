class Actor < ActiveRecord::Base
  has_many :characters
    has_many :shows, through: :characters

    def full_name
        self.first_name + " " + self.last_name
    end
  
    def list_roles
        roles_arr = []
        self.characters.each do |each_char|
            first = each_char.name
            last = each_char.show.name
            complete = first + " - " + last
            roles_arr << complete
        end
        roles_arr
    end  
end
