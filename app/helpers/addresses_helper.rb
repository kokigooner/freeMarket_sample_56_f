module AddressesHelper
  def user_address(address)
    "#{address.prefecture.name}
     #{address.minicipality}
     #{address.address}
     #{address.building}"
  end

  def user_name(address)
    "#{address.family_name}
     #{address.first_name}"
  end
end
