# 🍵 Tea Subscription Service Backend

## 📝 Overview of Project and Goals

Tea Subscription Service is a Rails API that allows users to manage tea subscriptions, including creating, viewing, and canceling subscriptions. The project was designed to demonstrate a strong understanding of RESTful principles, API design, and data management with a focus on clean, scalable code and well-structured testing.

Goals of the project include:
	•	Building a Rails API to handle subscription data
	•	Creating endpoints for viewing, creating, and canceling subscriptions
	•	Managing many-to-many relationships between subscriptions, teas, and customers
	•	Following RESTful conventions and JSON:API specification
	•	Writing thorough request and model tests with RSpec

## 🚀 Set Up

	1.	Clone the repository:

    git clone git@github.com:[your-username]/Mod-3-Final-Project-BE.git

	2.	Navigate into the directory;

    cd Mod-3-Final-Project-BE
    
    3.	Install dependencies:

    bundle install

	4.	Set up the database

    5.	Run the server

    rails s

    6.	Access the API

    •	Base URL: http://localhost:3000/api/v1

	•	Example endpoints:

	•	GET /subscriptions – Get all subscriptions

	•	GET /subscriptions/:id – Get details of a specific subscription

	•	PATCH /api/v1/subscriptions/2/subscription_customers/4?customer_id=3 – Cancel a subscription

  	7.	Run the test suite

    bundle exec rspec spec/request/models


## 🛠️ Technologies Used, Challenges, Wins & Reflections

Technologies Used:

	•	Backend: Ruby on Rails 

	•	Testing: RSpec, Faker, FactoryBot

	•	Serialization: jsonapi-serializer

	•	Database: PostgreSQL


Challenges Faced:

	•	Embedding related data directly under attributes in the JSON:API response

	•	Ensuring customers_subscribed updated dynamically after canceling subscriptions

	•	Managing strong params and custom controller actions

  Wins & Reflections:

✅ Created RESTful endpoints with clean, consistent JSON responses

✅ Successfully managed complex many-to-many relationships

✅ Implemented thorough test coverage for models and requests


## 👥 Contributors

[Joel Davalos](https://github.com/jdavalos98)
