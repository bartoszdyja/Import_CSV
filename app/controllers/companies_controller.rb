class CompaniesController < ApplicationController
  require 'csv'

  def new
  end

  def import
  	file = params[:file]
  	CSV.foreach(file.path) do |row|
  		@var = row
  	end
  	render plain: @var
  end
end
