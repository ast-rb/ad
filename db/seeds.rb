# TODO: Переделать под attr_access
puts 'Loading seed data now....'

Role.create(:name => "admin")
Role.create(:name => "user")
puts 'Roles added'

u1 = User.create(username: 'test1', email: 'test1@gmail.com', password: 'megapassword')
u2 = User.create(username: 'test2', email: 'test2@gmail.com', password: 'megapassw')
admin = User.create(username: 'admin', email: 'admin@gmail.com', password: 'adminpassw')

admin.role = Role.find_by_name("admin")
admin.save!
#User.find_by_email("test1@gmail.com").roles << Role.find_by_name("user")
#User.find_by_email("test2@gmail.com").roles << Role.find_by_name("user")
puts 'Users and admin added'

t1 = Type.create( name: 'Buy')
t2 = Type.create( name: 'Sell')
puts 'Types added'


ad = Ad.new(
  title: 'Ad-1',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  status: 'draft',
  type: t1,
)
ad.user = u1
ad.save!


ad = Ad.new(
  title: 'Ad-2',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  status: 'draft',
  type: t2,
)
ad.user = u2
ad.save!


ad = Ad.new(
  title: 'Ad-3',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  status: 'draft',
  type: t1,
)
ad.user = u1
ad.save!

ad = Ad.new(
  title: 'Ad-4',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  status: 'draft',
  type: t2,
)
ad.user = u2
ad.save!

ad = Ad.new(
  title: 'Ad-4',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  status: 'draft',
  type: t1,
)
ad.user = u1
ad.save!



Ad.create(title: 'Ad-6',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t2,
  user_id: u2,
  status: 'rejected'
)

Ad.create(title: 'Ad-7',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t1,
  user_id: u1,
  status: 'approved'
)

Ad.create(title: 'Ad-8',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t2,
  user_id: u2,
  status: 'approved'
)

Ad.create(title: 'Ad-9',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t1,
  user_id: u1,
  status: 'published'
)

Ad.create(title: 'Ad-10',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t2,
  user_id: u2,
  status: 'published'
)

Ad.create(title: 'Ad-11',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t1,
  user_id: u1,
  status: 'archive'
)

Ad.create(title: 'Ad-12',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t2,
  user_id: u2,
  status: 'archive'
)


Ad.create(title: 'Ad-13',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t1,
  user_id: u1,
  status: 'archive'
)


Ad.create(title: 'Ad-14',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t2,
  user_id: u2,
  status: 'archive'
)


Ad.create(title: 'Ad-15',
  body:
    %{<p>
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      </p>},
  type: t1,
  user_id: u1,
  status: 'archive'
)
puts 'Ads added'