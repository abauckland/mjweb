module Mjweb
  class IconPolicy < Struct.new(:user, :icon)
        
    def index?
      user.admin?
    end
    
    def new?
      user.admin?
    end 
    
    def create?
      user.admin?
    end    
    
    def delete?
      user.admin?
    end    
        
  end
end