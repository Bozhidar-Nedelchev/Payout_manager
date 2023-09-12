Brand.destroy_all

# Seed data for the Merchant model
merchants_data = [
  { name: 'Merchant 1', active: true, payout_rate: 0.05 },
  { name: 'Merchant 2', active: true, payout_rate: 0.1 }
]

# Create merchants based on the data
merchants = Merchant.create!(merchants_data)

# Seed data for the Brand model
brands_data = [
  { name: 'Brand A', description: 'Description for Brand A', active: true, redemption: 'online', merchant: merchants[0] },
  { name: 'Brand B', description: 'Description for Brand B', active: true, redemption: 'instore', merchant: merchants[1] },
  { name: 'Brand C', description: 'Description for Brand C', active: true, redemption: 'online', merchant: merchants[0] }
]

# Create brands based on the data
brands_data.each do |brand_params|
  Brand.create!(brand_params)
end

puts 'Seeded data for brands.'