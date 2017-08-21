brand = Brand.new(name: "Brand-1")
retailler = Retailler.new(name: "Retailler-1")
retailler.save!
brand.save!
User.create(email: "brand_1@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 0, company: "Brand-1",
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "brand_1", lastname_contact: "brand_1", phone: "123424",
      description: "description", activated: 1, brand_id: brand.id)

User.create(email: "retailler_1@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 1,company: "Retailler-1",
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "retailler_1", lastname_contact: "retailler_1", phone: "123424",
      description: "description", activated: 1, retailler_id: retailler.id)

brand1 = Brand.new(name: "Brand-2")
retailler1 = Retailler.new(name: "Retailler-2")
retailler1.save!
brand1.save!
User.create(email: "brand_2@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 0, company: "Brand-2",
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "brand_2", lastname_contact: "brand_2", phone: "123424",
      description: "description", activated: 1, brand_id: brand1.id)

User.create(email: "retailler_2@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 1,company: "Retailler-2",
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "retailler_2", lastname_contact: "retailler_2", phone: "123424",
      description: "description", activated: 1, retailler_id: retailler1.id)



brand2 = Brand.new(name: "Brand-3")
retailler2 = Retailler.new(name: "Retailler-3")
retailler2.save!
brand2.save!
User.create(email: "brand_3@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 0, company: "Brand-2",
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "brand_2", lastname_contact: "brand_2", phone: "123424",
      description: "description", activated: 1, brand_id: brand2.id)

User.create(email: "retailler_3@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 1,company: "Retailler-2",
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "retailler_3", lastname_contact: "retailler_3", phone: "123424",
      description: "description", activated: 1, retailler_id: retailler2.id)


# brand3 = Brand.new(name: "Brand-4")
# retailler3 = Retailler.new(name: "Retailler-4")
# retailler3.save!
# brand3.save!
User.create(email: "admin_1@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 2, company: "Brand-2",
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "brand_2", lastname_contact: "brand_2", phone: "123424",
      description: "description", activated: 1)

User.create(email: "admin_2@example.com", password: "12345678",
   password_confirmation: "12345678", type_user: 2,company: "Retailler-2",
      website: "example.com", address: "Viet Nam", zip_code: "10000",
      country: "VietNam", firstname_contact: "retailler_3", lastname_contact: "retailler_3", phone: "123424",
      description: "description", activated: 1)

#rake product types

array = ["Apparel", "Shoes", "Accessories", "Bags and Purses", "Jewelry and Watches", "Sportswear and Swimwear", "Underwear and Nightwear"]
sell_types = ["Pre-Order", "Inventory"]

array.each do |product_type|
  Producttype.create(name: product_type)
end
sell_types.each do |sell_type|
  Selltype.create(name: sell_type)
end
