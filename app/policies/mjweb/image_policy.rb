module Mjweb
  class ImagePolicy < Struct.new(:user, :record)
  
    class Scope < Struct.new(:user, :scope)
      def resolve
          scope.where(:company_id => user.company_id) 
      end
    end

  end
end