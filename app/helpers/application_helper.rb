# frozen_string_literal: true

module ApplicationHelper
  def navigation_links(mobile: false)
    links = [
      { url: about_me_path, text: t('navbar.about_me'), controller: 'home#about_me' },
      { url: resume_path, text: t('navbar.resume'), controller: 'home#resume' },
      { url: portfolio_path, text: t('navbar.portfolio'), controller: 'home#portfolio' },
      { url: malt_url, text: t('navbar.contact_me') }
    ]

    links.map { |link| link_html(link, active: active_page?(link), mobile:) }.join.html_safe
  end

  def render_svg(path)
    File.open(Rails.root.join("app/assets/svg/#{path}.svg"), 'rb') do |file|
      raw file.read
    end
  end

  def switch_locale_url
    new_locale = locale == :en ? :fr : :en

    url_for(locale: new_locale)
  end

  private

  def active_page?(link)
    current_page?(link[:url]) || link[:controller] == "#{controller.controller_name}##{controller.action_name}"
  end

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
      text-gray-700 dark:text-gray-300 hover:bg-slate-300 dark:hover:bg-gray-800 hover:text-slate-700
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
      text-gray-700 dark:text-gray-300 hover:bg-slate-300 dark:hover:bg-gray-700 hover:text-white block rounded-md
      px-3 py-2 text-base font-medium
    CLASSES
  end

  def mobile_active_nav_item_classes
    <<~CLASSES.squish
      bg-gray-900 dark:bg-indigo-800 text-white block rounded-md px-3 py-2 text-base font-medium
    CLASSES
  end
end
