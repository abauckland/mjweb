module Mjweb
  module PagesHelper
  
    def page_used(page)
     linktile = Mjweb::Linktile.joins(:page).where('mjweb_pages.id' => page.id).first
     infolink = Mjweb::Info.where(:link_page_id => page.id).first
      if linktile.blank? && infolink.blank?
        link_to '', page, :method => :delete, data: { confirm: 'Are you sure, all the information contained within the page will also be deleted?' }, class: 'line_delete_icon', title: "delete tile"
      end
    end
  
  
  end
end