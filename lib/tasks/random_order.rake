namespace :random_order do
  desc "Create a random order with random client data"
  task create_random_order_with_items: :environment do
    # Создание случайного заказа
    order = Order.create(
      total_amount: 0,
      order_date_time: Faker::Date.between(from: 1.year.ago, to: Date.today),
      client_name: Faker::Name.name,
      client_email: Faker::Internet.email,
      delivery_address: Faker::Address.full_address,
      client_phone: Faker::PhoneNumber.phone_number
    )

    random_item_counts = rand(1..10)

    random_item_counts.times do
      item_subtotal = rand(50..2000)
      order_item = OrderItem.create(
        subtotal: item_subtotal,
        product_name: Faker::Commerce.product_name,
        product_price: item_subtotal,
        quantity: 1,
        order: order
      )

      order.total_amount += item_subtotal
      order_item.save
    end

    order.save
  end
end