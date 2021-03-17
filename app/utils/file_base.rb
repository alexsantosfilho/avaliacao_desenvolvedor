class FileBase
  def self.process_file(file)
    sale = []
    file.each.with_index do |row, idx|
      next if idx == 0

      col = row.to_s.split(/\t/)
      customer_name = col[0]
      description = col[1]
      unit_price = Float(col[2])
      quantity = Float(col[3])
      address = col[4]
      vendor_name = col[5]
      sale << {
        customer_name: customer_name, description: description,
        unit_price: unit_price, quantity: quantity,
        address: address, vendor_name: vendor_name
      }
    end
    sale
  end
end
