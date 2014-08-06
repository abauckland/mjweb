
  class Mjweb::ApplicationController < ApplicationController
       layout "mjweb/layouts/admin"    
      def set_company  
        subdomain = request.subdomain(tld_length = 2)

        if subdomain == 'www'
          company = ::Company.find_by_sql(["SELECT * FROM companies WHERE id = ?", 1])
        else
          company = ::Company.find_by_sql(["SELECT * FROM companies WHERE subdomain = ?", subdomain])   
        end

        if !company.empty?
          selected = company.first
          company_id = selected[:id]
              @sub_company = ::Company.find(company_id) 
        else
          @sub_company = ::Company.find(1) 
        end            
      end
    
  end
