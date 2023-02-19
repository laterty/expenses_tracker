# frozen_string_literal: true

user1 = FactoryBot.create(:user, email: 'yolo@yolo.com', password: 'Yolo123*')
user2 = FactoryBot.create(:user, email: 'polo@polo.com', password: 'Polo123*')

%w[Traveling Clothing Taxi Cafes Shops Other].each do |name|
  category = FactoryBot.create(:category, name:)
  FactoryBot.create_list(:expense, rand(1..9), category:, user: user1)
  FactoryBot.create_list(:expense, rand(1..9), category:, user: user2)
end
