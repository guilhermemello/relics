require 'will_paginate'

module WillPaginate
  module ActionView
    def will_paginate(collection = nil, options = {})
      options[:renderer] ||= BootstrapLinkRenderer
      super.try :html_safe
    end
 
    class RelicsLinkRenderer < LinkRenderer
      protected
      
      def html_container(html)
        tag :div, tag(:span, html), :class => "dataTables_paginate paging_full_numbers"
      end
 
      def page_number(page)
        if page == current_page
          link(page, page, :rel => rel_value(page), :class => ('paginate_active'))
        else
          link(page, page, :rel => rel_value(page), :class => ('paginate_button'))
        end
      end
 
      def previous_or_next_page(page, text, classname)
        if text == "Anterior"
          link(text, page || '#', :class => ["previous paginate_button", ('paginate_button_disabled' unless page)].join(' '))
        else
          link(text, page || "#", :class => ["next paginate_button", ('paginate_button_disabled' unless page)].join(' '))
        end
      end
    end
  end
end
