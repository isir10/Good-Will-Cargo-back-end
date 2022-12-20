cargo_ship_img_urls = [
    "https://i.postimg.cc/h4T8N083/Whats-App-Image-2022-12-04-at-18-51-31.jpg",
    "https://i.postimg.cc/zBWWZJhR/Whats-App-Image-2022-12-04-at-18-51-32.jpg",
    "https://i.postimg.cc/0jsS9LGX/Whats-App-Image-2022-12-04-at-18-51-34.jpg",
    "https://i.postimg.cc/KjDMjJJG/Whats-App-Image-2022-12-04-at-18-51-35.jpg",
    "https://i.postimg.cc/446tWxZD/Whats-App-Image-2022-12-04-at-18-51-36.jpg",
    "https://i.postimg.cc/3J9GHfk9/Whats-App-Image-2022-12-04-at-18-51-37.jpg",
    "https://i.postimg.cc/qvR3Bcnr/Whats-App-Image-2022-12-04-at-18-51-38.jpg",
    "https://i.postimg.cc/kX7SzPgB/Whats-App-Image-2022-12-04-at-18-51-39.jpg",
    "https://i.postimg.cc/SxvznX7M/Whats-App-Image-2022-12-04-at-18-51-40.jpg",
    "https://i.postimg.cc/pLbL4DZk/Whats-App-Image-2022-12-04-at-18-51-35-1.jpg",
    "https://i.postimg.cc/4x6xgm2G/Whats-App-Image-2022-12-04-at-18-51-36-1.jpg",
    "https://i.postimg.cc/YStqqMTW/Whats-App-Image-2022-12-04-at-18-51-36-2.jpg",
    "https://i.postimg.cc/3w9rkzHb/Whats-App-Image-2022-12-04-at-18-51-37-1.jpg",
    "https://i.postimg.cc/PxxXYKXf/Whats-App-Image-2022-12-04-at-18-51-37-2.jpg",
    "https://i.postimg.cc/DZM2gs0r/Whats-App-Image-2022-12-04-at-18-51-38-1.jpg",
    "https://i.postimg.cc/668RNfrN/Whats-App-Image-2022-12-04-at-18-51-38-2.jpg",
    "https://i.postimg.cc/RC2tCJdJ/Whats-App-Image-2022-12-04-at-18-51-39-1.jpg",
    "https://i.postimg.cc/nc7DXVSR/Whats-App-Image-2022-12-04-at-18-51-39-2.jpg",
    "https://i.postimg.cc/YCHmYcJp/Whats-App-Image-2022-12-04-at-18-51-40-1.jpg"
    ]



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

User.first.user_cargos.create(user_id: 1, cargo_ship_id: 1)