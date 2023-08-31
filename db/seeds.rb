# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: "Usom", email: "usom@gmail.com", password: "123456")

ActiveRecord::Base.transaction do
  Course.create(name: "Ruby on Rails", description: "Ruby on Rails, often referred to simply as Rails, is an open-source web application framework written in the Ruby programming language.
    Rails is designed to make it easier to build dynamic and robust web applications by providing a structured and organized development environment. 
    It follows the Model-View-Controller (MVC) architectural pattern, which separates the application's concerns into three distinct components", 
    price: 20.00, teacher: "Burger", photo:"https://tinyurl.com/5e4tdnyv")

  Course.create(name: "Python for Data Science", description: "Learn how to leverage the power of Python for data analysis and visualization. Explore libraries like NumPy, Pandas, and Matplotlib to process and visualize data effectively.", 
    price: 25.00, teacher: "Smith", photo: "https://tinyurl.com/3u9cw3da")

  Course.create(name: "Full Stack Web Dev", description: "Become a full stack web developer by mastering both front-end and back-end technologies. Learn HTML, CSS, JavaScript, Node.js, and databases to build complete web applications.", 
    price: 30.00, teacher: "Johnson", photo: "https://tinyurl.com/wvxcstn6")

  Course.create(name: "Machine Learning Fundamentals", description: "Dive into the world of machine learning. Understand the basics of supervised and unsupervised learning, and get hands-on experience with popular machine learning frameworks.", 
    price: 40.00, teacher: "Garcia", photo: "https://tinyurl.com/y4brxtc8")

  Course.create(name: "Mobile App Dev(Flutter)", description: "Create cross-platform mobile apps using Flutter framework. Build native-like apps for iOS and Android with a single codebase, and explore widgets, animations, and APIs.", 
    price: 28.00, teacher: "Lee", photo: "https://tinyurl.com/399e9w5e")

  Course.create(name: "Intro to Blockchain Tech", description: "Discover the fundamentals of blockchain technology and cryptocurrencies. Learn about decentralized ledgers, smart contracts, and how blockchain is transforming industries.", 
    price: 22.00, teacher: "Brown", photo: "https://tinyurl.com/4t9vf7v3")
end
