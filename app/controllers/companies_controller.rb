class CompaniesController < ApplicationController
  require 'csv'

  def new
  end

  def import
  	file = params[:file]
  	CSV.foreach(file.path, headers: true) do |row|
  		@company_name = row['Name']
  		Company.where(name: @company_name).first_or_create
  	end
  	render plain: @company_name
  end
end
