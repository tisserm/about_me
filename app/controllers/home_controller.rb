# frozen_string_literal: true

class HomeController < ApplicationController
  def about_me
  end

  def resume
    @age = DateCalculations.years_since(Date.new(1997, 7, 19))
    @skills = {
      'Ruby / Rails': 5,
      'HTML & CSS': 4,
      'Hotwire': 4,
      'VueJS': 3,
      'Git / Github': 5,
      'Heroku': 4
    }
  end

  def portfolio
  end

  def download_resume
    send_file "#{Rails.root}/files/CV.pdf", filename: 'resume.pdf', type: 'application/pdf'
  end
end
