class SalesController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @sales = Sale.all
    @total_sales = @sales.map { |data| data[:unit_price].to_f * data[:quantity].to_f }.reduce(0) { |sum, x| sum + x }
  end

  def new_sale(params)
    @sale = Sale.new(sale_params)
    @sale.unit_price = params[:unit_price]
    @sale.description = params[:description]
    @sale.quantity = params[:quantity]
    @sale.customer = Customer.find_or_create_by(name: params[:customer_name])
    @sale.address =  Address.find_or_create_by(name: params[:address])
    @sale.vendor = Vendor.find_or_create_by(name: params[:vendor_name])
    @sale.save!
  rescue StandardError
    flash[:error] = 'Error ao salvar'
  end

  def import
    unless sale_upload_params[:file]
      redirect_to :root
      return
    end
    uploaded_file = sale_upload_params[:file]
    content_file = uploaded_file.read.force_encoding('UTF-8')

    if content_file.blank?
      redirect_to :root
      flash[:error] = 'arquivo sem dados'
      return
    end

    unless content_file.each_line.first.split(/\t/).size == 6
      redirect_to :root
      flash[:error] = 'Error no formato'
      return
    end

    rows = content_file.to_s.split(/\n/)

    process_file = FileBase.process_file(rows)

    process_file.each do |params|
      new_sale(params)
    end

    redirect_to sales_path, flash: { notice: 'importado com sucesso' }
  end

  private

  def sale_upload_params
    params.permit(:file)
  end

  def sale_params
    params.permit(:customer_name, :vendor_name, :address)
  end
end
