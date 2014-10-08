module Mjweb
  class FontPolicy < Struct.new(:user, :font)
        
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