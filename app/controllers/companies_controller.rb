class CompaniesController < ApplicationController
  require 'csv'

  def new
  end

  def index
  	@companies = Company.all
  end

  def import
  	file = params[:file]
  	CSV.foreach(file.path, headers: true) do |row|
  		@company_name = row['Name']
  		@operation_name = row['Operation']
  		@company = Company.where(name: @company_name).first_or_create
  		@o = Operation.where(name: @operation_name).first_or_create
  		@o.companies << @company
  		@o.save
  	end
  	redirect_to companies_path
  end
end
