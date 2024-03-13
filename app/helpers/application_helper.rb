# frozen_string_literal: true

module ApplicationHelper
  def navigation_links(mobile: false)
    links = [
      { url: root_path, text: 'About me' },
      { url: resume_path, text: 'Resume' },
      { url: portfolio_path, text: 'Portfolio' },
      { url: malt_url, text: 'Contact me on Malt' }
    ]

    links.map { |link| link_html(link, active: current_page?(link[:url]), mobile:) }.join.html_safe
  end

  private

  def link_html(link, active: false, mobile: false)
    classes = if active && mobile
                mobile_active_nav_item_classes
              elsif active
                active_nav_item_classes
              elsif mobile
                mobile_nav_item_classes
              else
                nav_item_classes
              end

    link_to link[:text], link[:url], class: classes
  end

  def nav_item_classes
    <<~CLASSES.squish
      text-slate-500 dark:text-gray-300 hover:bg-slate-300 dark:hover:bg-gray-800 hover:text-slate-700 
      dark:hover:text-white rounded-md px-3 py-2 text-sm font-medium
    CLASSES
  end

  def active_nav_item_classes
    <<~CLASSES.squish
      bg-gray-900 dark:bg-indigo-800 text-white rounded-md px-3 py-2 text-sm font-medium
    CLASSES
  end

  def mobile_nav_item_classes
    <<~CLASSES.squish
      text-slate-500 dark:text-gray-300 hover:bg-slate-300 dark:hover:bg-gray-700 hover:text-white block rounded-md 
      px-3 py-2 text-base font-medium
    CLASSES
  end

  def mobile_active_nav_item_classes
    <<~CLASSES.squish
      bg-gray-900 dark:bg-indigo-800 text-white block rounded-md px-3 py-2 text-base font-medium
    CLASSES
  end
end
