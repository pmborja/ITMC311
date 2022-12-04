json.extract! posting, :id, :property_name, :address, :rent_per_month, :service_charge, :additional_charges, :security_deposit, :property_size, :property_type, :rooms, :other_details, :inclusions, :created_at, :updated_at
json.url posting_url(posting, format: :json)
