# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# db/seeds.rb

# db/seeds.rb

# db/seeds.rb

# db/seeds.rb

# Seed Countries

ActiveRecord::Base.transaction do
  # Clear existing data
  Country.destroy_all
  Merchant.destroy_all
  Brand.destroy_all
  Product.destroy_all
  Card.destroy_all

countries = []

countries = []
2.times do |i|
  country = Country.create!(
    name: "Country #{i + 1}",
    currency: "USD",
  )
  countries << country
end

# Seed Merchants with associated Countries
countries.each do |country|
  2.times do |i|
    merchant = Merchant.create!(
      name: "Merchant #{i + 1} in #{country.name}",
      payout_rate: rand(5..15), # Replace with your desired logic
      active: true,
      country: country
    )

    # Seed Brands for each Merchant
    3.times do |j|
      brand = Brand.create!(
        name: "Brand #{j + 1} for #{merchant.name}",
        active: true,
        description: "Description for Brand #{j + 1}",
        redemption: "online",
        merchant: merchant
      )

      # Seed Products for each Brand
      2.times do |k|
        product = Product.create!(
          name: "Product #{k + 1} for #{brand.name}",
          active: true,
          amount: Money.new(rand(1000..5000), country.currency), # Random amount in USD
          brand: brand
        )

        # Seed Cards for each Product with unique activation numbers
        # Seed Cards for each Product with unique activation numbers
        5.times do |l|
          card = Card.create!(
            status: 'available',
            product: product,
            amount: Money.new(rand(50..200), country.currency), # Use country currency
            activation_number: "ACT#{k + 1}-#{l + 1}" # Unique activation number
          )
        end
      end
    end
  end
end
end
# Seed other models here


# Seed other models here



