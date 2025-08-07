module AddressParser
  def extract_zipcode(address)
    address.scan(/\b\d{5}\b/).first
  end
end
