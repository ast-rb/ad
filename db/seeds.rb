puts 'Loading seed data now....'

Role.create(:name => "admin")
Role.create(:name => "user")
puts 'Roles added'

u1 = User.create(username: 'test1', email: 'test1@gmail.com', password: 'megapassword')
u2 = User.create(username: 'test2', email: 'test2@gmail.com', password: 'megapassw')
admin = User.create(username: 'admin', email: 'admin@gmail.com', password: 'adminpassw')

admin.role = Role.find_by_name("admin")
admin.save!
puts 'Users and admin added'

t1 = Type.create(name: 'Buy')
t2 = Type.create(name: 'Sell')
puts 'Types added'


body = %{<p>
          CoffeeScript is JavaScript done right. It provides all of JavaScript's
  	functionality wrapped in a cleaner, more succinct syntax. In the first
  	book on this exciting new language, CoffeeScript guru Trevor Burnham
  	shows you how to hold onto all the power and flexibility of JavaScript
  	while writing clearer, cleaner, and safer code.
        </p>}


def create_ad(title, body, type, state, user)
  ad = Ad.new(
      title: title,
      body: body,
      type: type
  )
  ad.state = state
  ad.user = user
  ad.save!
end

create_ad('Ad-1', body, t1, 'draft', u1)
create_ad('Ad-2', body, t2, 'draft', u2)
create_ad('Ad-3', body, t1, 'draft', u1)
create_ad('Ad-4', body, t2, 'draft', u2)
create_ad('Ad-5', body, t1, 'draft', u1)

create_ad('Ad-6', body, t2, 'approved', u2)
create_ad('Ad-7', body, t1, 'approved', u1)
create_ad('Ad-8', body, t2, 'approved', u1)
create_ad('Ad-9', body, t1, 'published', u1)
create_ad('Ad-10', body, t2, 'published', u1)

create_ad('Ad-11', body, t1, 'archive', u1)
create_ad('Ad-12', body, t2, 'archive', u1)
create_ad('Ad-13', body, t1, 'archive', u1)
create_ad('Ad-14', body, t2, 'archive', u2)
create_ad('Ad-15', body, t1, 'archive', u1)


puts 'Ads added'