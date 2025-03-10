Tea.create(title: 'Green Tea', description: 'A refreshing tea', temperature: '80°C', brew_time: 3)
Customer.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', address: '123 Street')
Subscription.create(title: 'Monthly Subscription', price: 19.99, status: 'active', frequency: 'monthly', customer_id: 1, tea_id: 1)