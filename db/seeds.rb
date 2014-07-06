# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alice = User.create(username: 'alice', email: 'alice@gmail.com', password: 'password')
bob = User.create(username: 'bob', email: 'bob@gmail.com', password: 'password')
clemence = User.create(username: 'clemence', email: 'clemence@gmail.com', password: 'password')
alice.posts.create(
  title: 'GNC shake cup',
  description: 'It is great for mixing protein shake. I used for 2 years',
  remote_main_photo_url: 'http://www.gnc.com/graphics/product_images/pGNC1-3355997t300x300.jpg'
)
alice.posts.create(
  title: 'Rfid Wallet',
  description: 'Passante Bobble Head. I used for 2 years',
  remote_main_photo_url: 'http://a.tgcdn.net/images/products/zoom/8cdd_rfid_blocking_wallet.jpg'
)
alice.posts.create(
  title: 'Nike Basketball',
  description: 'Still pretty good condition. I used for 2 years',
  remote_main_photo_url: 'http://www.sportarena.gr/Uploads/Product-Images/12413/Nike_Elite_Basketball_BB0401_801_b_dv_b1.jpg'
)
bob.posts.create(
  title: 'Nike Usb',
  description: 'Still pretty good condition. I used for 2 years',
  remote_main_photo_url: 'http://www.techfresh.net/wp-content/uploads/2007/01/berlinaf1usbdrive-thumb.jpg'
)
bob.posts.create(
  title: 'Lebron Bbal shoes',
  description: 'Still pretty good condition. I used for 2 years',
  remote_main_photo_url: 'http://www.lebroncheap11.com/pic/Cheap-Nike-Foamposite-One-2013-White-Black---1-126.jpg'
)

bob.requests.create(post_id: 1, body:'I want it so bad. Please give it to meeeeeee.')
clemence.requests.create(post_id: 1, body:'I want it more. give it to meeeeeee.')
clemence.requests.create(post_id: 2, body:'I want it more. give it to meeeeeee.')
