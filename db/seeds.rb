brand = Brand.new(name: "Brand")
brand.save!
User.create(email: "admin@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 2,
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "Admin", lastname_contact: "admin", phone: "123424",
      description: "description", activated: 1, brand_id: brand.id)

User.create(email: "user_1@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 2,
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "user_1", lastname_contact: "user_1", phone: "123424",
      description: "description", activated: 0, brand_id: brand.id)
User.create(email: "user_2@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 0,
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "user_2", lastname_contact: "user_2", phone: "123424",
      description: "description", activated: 0, brand_id: brand.id)


#rake product types

array = ["Apparel", "Shoes", "Accessories", "Bags and Purses", "Jewelry and Watches", "Sportswear and Swimwear", "Underwear and Nightwear"]
sell_types = ["Pre-Order", "Inventory"]

array.each do |product_type|
  Producttype.create(name: product_type)
end
sell_types.each do |sell_type|
  Selltype.create(name: sell_type)
end