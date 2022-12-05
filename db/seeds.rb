cargo_ship_img_urls = ["https://i.ibb.co/SmxWwy7/Whats-App-Image-2022-12-04-at-18-51-40-1.jpg",
"https://i.ibb.co/zGVNt6Y/Whats-App-Image-2022-12-04-at-18-51-40.jpg",
"https://i.ibb.co/bJNgNw0/Whats-App-Image-2022-12-04-at-18-51-39-2.jpg",
"https://i.ibb.co/HpZvZYG/Whats-App-Image-2022-12-04-at-18-51-39-1.jpg",
"https://i.ibb.co/L8KFvtS/Whats-App-Image-2022-12-04-at-18-51-39.jpg" ,
"https://i.ibb.co/jvMRj3k/Whats-App-Image-2022-12-04-at-18-51-38-2.jpg",
"https://i.ibb.co/kMSR4H9/Whats-App-Image-2022-12-04-at-18-51-36-2.jpg",
"https://i.ibb.co/rGY8SrD/Whats-App-Image-2022-12-04-at-18-51-36-1.jpg",
"https://i.ibb.co/KwCbXVy/Whats-App-Image-2022-12-04-at-18-51-36.jpg" ,
"https://i.ibb.co/rZ4Gpxn/Whats-App-Image-2022-12-04-at-18-51-35-1.jpg",
"https://i.ibb.co/1v8H8XX/Whats-App-Image-2022-12-04-at-18-51-35.jpg",
"https://i.ibb.co/GtyrVcy/Whats-App-Image-2022-12-04-at-18-51-34.jpg",
"https://i.ibb.co/cXmkbqG/Whats-App-Image-2022-12-04-at-18-51-32.jpg",
"https://i.ibb.co/bvLq4Md/Whats-App-Image-2022-12-04-at-18-51-31.jpg", 
"https://i.ibb.co/5LmPV5g/Whats-App-Image-2022-12-04-at-18-51-38-1.jpg",
"https://i.ibb.co/HFVWKS2/Whats-App-Image-2022-12-04-at-18-51-38.jpg",
"https://i.ibb.co/wWkXjLq/Whats-App-Image-2022-12-04-at-18-51-37-2.jpg",
"https://i.ibb.co/Z6qC968/Whats-App-Image-2022-12-04-at-18-51-37-1.jpg",
"https://i.ibb.co/QXYkSvC/Whats-App-Image-2022-12-04-at-18-51-37.jpg"]



cargo_ship_img_urls.length.times do |i|
    CargoShip.create(name: "#{Faker::Ancient.titan} #{Faker::Name.middle_name}", 
        current_location:Faker::Address.city, 
        destination:Faker::Address.city, 
        leaving_date:Faker::Date.forward,
        rate_per_cargo:(600000..1500000).to_a.sample,
        img_url: cargo_ship_img_urls[-i],
        capacity: (10000..21000).to_a.sample,
        remaining: (300..700).to_a.sample
    )
end

User.create(username: "Test", password: "Test", password_confirmation: "Test", email: "test@email.com
    ", bio: "Test", img_url: "https://i.ibb.co/L8KFvtS/Whats-App-Image-2022-12-04-at-18-51-39.jpg")