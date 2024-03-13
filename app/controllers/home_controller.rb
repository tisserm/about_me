# frozen_string_literal: true

class HomeController < ApplicationController
  def about_me
  end

  def resume
  end

  def portfolio
  end

  def download_resume
    send_file "#{Rails.root}/files/CV.pdf", filename: 'resume.pdf', type: 'application/pdf'
  end
end
