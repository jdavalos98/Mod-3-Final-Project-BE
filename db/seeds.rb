tea1 = Tea.create(title: 'Green Tea', description: 'A refreshing and healthy tea.', temperature: 185, brew_time: 3)
tea2 = Tea.create(title: 'Black Tea', description: 'Strong and robust tea.', temperature: 172, brew_time: 5)
tea3 = Tea.create(title: 'Chamomile Tea', description: 'A calming herbal tea.', temperature: 190, brew_time: 4)

customer1 = Customer.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', address: '123 Elm St, Springfield')
customer2 = Customer.create(first_name: 'Jane', last_name: 'Smith', email: 'jane.smith@example.com', address: '456 Oak St, Springfield')
customer3 = Customer.create(first_name: 'Alex', last_name: 'Johnson', email: 'alex.johnson@example.com', address: '789 Pine St, Springfield')

subscription1 = Subscription.create(title: 'Monthly Green Tea', price: 19.99, frequency: 'Monthly')
subscription2 = Subscription.create(title: 'Weekly Black Tea', price: 9.99, frequency: 'Weekly')
subscription3 = Subscription.create(title: 'Bi-weekly Chamomile Tea', price: 14.99, frequency: 'Bi-weekly')

SubscriptionCustomer.create(subscription_id: subscription1.id, customer_id: customer1.id, status: true)
SubscriptionCustomer.create(subscription_id: subscription1.id, customer_id: customer2.id, status: true)
SubscriptionCustomer.create(subscription_id: subscription2.id, customer_id: customer2.id, status: true)
SubscriptionCustomer.create(subscription_id: subscription2.id, customer_id: customer3.id, status: false)
SubscriptionCustomer.create(subscription_id: subscription3.id, customer_id: customer1.id, status: true)

SubscriptionTea.create(subscription_id: subscription1.id, tea_id: tea1.id)
SubscriptionTea.create(subscription_id: subscription2.id, tea_id: tea2.id)
SubscriptionTea.create(subscription_id: subscription3.id, tea_id: tea3.id)