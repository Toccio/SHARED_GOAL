require 'faker'
require "open-uri"

puts "Creating database"
Skill.destroy_all
List.destroy_all
Message.destroy_all
User.destroy_all
Classroom.destroy_all
Booking.destroy_all
puts "Database created 👌"

user = User.create!(
  email: "scheggia1190@gmail.com",
  password:"123456",
  first_name: Faker::Games::Heroes.name,
  last_name: Faker::Creature::Bird.common_family_name,
  nickname: Faker::Games::Pokemon.name
)

levels = ["Beginner", "Intermediate", "Advanced"]

list_category = [
  "Music", "Web Development", "Photography", "Animation",
  "Graphic Design", "Illustration", "Personal Development", "Creative Writing",
  "Film & Video"
]

i = 0
9.times do
  @list = List.create!(
    name: list_category[i],
    description: "Put the description",
    photo: Faker::LoremFlickr.image(size: "358x100", search_terms: ['sports'])
  )

  if @list.name == "Music"

    # INSTRUMENTS
    # 1 Trumpet
    file = URI.open('https://images.unsplash.com/photo-1511192336575-5a79af67a629?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dHJ1bXBldHxlbnwwfHwwfHw%3D&w=1000&q=80')
    @instrument = Instrument.new(name: "Trumpet", list: @list)
    @instrument.photo.attach(io: file, filename: 'Trumpet.png', content_type: 'image/png')
    @instrument.save!

    # 2 Flute
    file = URI.open('https://www.musicianwave.com/wp-content/uploads/2021/04/types-of-flutes-1536x1024.jpg')
    @instrument = Instrument.new(name: "Flute", list: @list)
    @instrument.photo.attach(io: file, filename: 'Flute.png', content_type: 'image/png')
    @instrument.save!

    # 3 Ukelele
    file = URI.open('https://media.istockphoto.com/photos/playing-ukulele-picture-id477710820?k=20&m=477710820&s=612x612&w=0&h=f27eIuyv7peSPPh_wivykGeieJYC3gI7wuRWozB1K1g=')
    @instrument = Instrument.new(name: "Ukelele", list: @list)
    @instrument.photo.attach(io: file, filename: 'Ukelele.png', content_type: 'image/png')
    @instrument.save!

    # 4 Harmonica
    file = URI.open('https://leeoskar.com/wp-content/uploads/2016/10/Lee-Oskar-Harmonica-with-guitar-Tombo.jpg')
    @instrument = Instrument.new(name: "Harmonica", list: @list)
    @instrument.photo.attach(io: file, filename: 'Harmonica.png', content_type: 'image/png')
    @instrument.save!

    # 5 Cello
    file = URI.open('https://render.fineartamerica.com/images/images-profile-flow/400/images/artworkimages/mediumlarge/2/cello-dny59.jpg')
    @instrument = Instrument.new(name: "Cello", list: @list)
    @instrument.photo.attach(io: file, filename: 'Cello.png', content_type: 'image/png')
    @instrument.save!

    # 6 Clarinet
    file = URI.open('https://phamoxmusic.com/wp-content/uploads/2020/03/Clarinet-PIC-001.jpg')
    @instrument = Instrument.new(name: "Clarinet", list: @list)
    @instrument.photo.attach(io: file, filename: 'Clarinet.png', content_type: 'image/png')
    @instrument.save!

    # 7 Oboe
    file = URI.open('https://www.reedmaker.com/static/Reed-Shop-Music-6a92d38cb51c57fc72f8248957d79ee2.jpg')
    @instrument = Instrument.new(name: "Oboe", list: @list)
    @instrument.photo.attach(io: file, filename: 'Oboe.png', content_type: 'image/png')
    @instrument.save!

    # 8 Saxophone
    file = URI.open('https://images.squarespace-cdn.com/content/v1/6088b5d76b40ec2a18c4a5c5/1660145870351-J2SR09XO296EMUV0276S/image0.jpeg?format=1000w')
    @instrument = Instrument.new(name: "Saxophone", list: @list)
    @instrument.photo.attach(io: file, filename: 'Saxophone.png', content_type: 'image/png')
    @instrument.save!

    # 9 Piano
    file = URI.open('https://media.istockphoto.com/photos/favorite-classical-musicclose-up-view-of-gentle-female-hands-playing-picture-id1129332575?k=20&m=1129332575&s=612x612&w=0&h=DTpOnAdbtHwbC60LMOpSOlMOogOPg8wyyIRvJzwJtc8=')
    @instrument = Instrument.new(name: "Piano", list: @list)
    @instrument.photo.attach(io: file, filename: 'Piano.png', content_type: 'image/png')
    @instrument.save!

    # 10 Violin
    file = URI.open('https://images.immediate.co.uk/production/volatile/sites/24/2021/03/when-was-the-violin-invented-2ccbe78.jpg')
    @instrument = Instrument.new(name: "Violin", list: @list)
    @instrument.photo.attach(io: file, filename: 'Violin.png', content_type: 'image/png')
    @instrument.save!

    # 11 Banjo
    file = URI.open('https://www.liveabout.com/thmb/QIO5yRjayKZwL8byzMRigSd_iOc=/1788x1341/smart/filters:no_upscale()/midsection-of-man-playing-banjo-with-fingerpicks-629725327-5ad51a296bf0690037f0b7d9.jpg')
    @instrument = Instrument.new(name: "Banjo", list: @list)
    @instrument.photo.attach(io: file, filename: 'Banjo.png', content_type: 'image/png')
    @instrument.save!

    # 15 Guitar
    file = URI.open('https://fkb.dk/sites/frederiksberg.ddbcms.dk/files/title_image/news/photo-of-person-playing-acoustic-guitar-1751731_photo_by_brent_keane_from_pexels.jpg')
    @instrument = Instrument.new(name: "Guitar", list: @list)
    @instrument.photo.attach(io: file, filename: 'Guitar.png', content_type: 'image/png')
    @instrument.save!


    # GUITARS
    # 1 ACOUSTIC GUITAR
    file = URI.open('https://www.ibanez.com/common/product_artist_file/file/pc_main_acoustic_guitars_na.jpg')
    @classroom_category = ClassroomCategory.new(name: "Acoustic Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Acoustic Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 2 ELECTRIC GUITAR
    file = URI.open('https://cdn.mos.cms.futurecdn.net/Yh6r74b8CAj2jbdf2FAhq4.jpg')
    @classroom_category = ClassroomCategory.new(name: "Electric Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Electric Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 3 BASS GUITAR
    file = URI.open('https://42796r1ctbz645bo223zkcdl-wpengine.netdna-ssl.com/wp-content/uploads/2016/07/1260x485-bass-guitar-1281x612.jpg')
    @classroom_category = ClassroomCategory.new(name: "Bass Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Bass Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 4 CLASSIC GUITAR
    file = URI.open('https://cdn.shopify.com/s/files/1/0557/0556/7432/articles/acoustic-vs-classical_7aa53ad4-bd8b-4b5e-94be-7cb6fde78a4b.jpg')
    @classroom_category = ClassroomCategory.new(name: "Classic Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Classic Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 5 Heavy Metal GUITAR
    file = URI.open('https://www.premierguitar.com/media-library/explorer-heavy-metal-guitar.png?id=29965620&width=1500&height=2000&coordinates=708%2C0%2C709%2C0')
    @classroom_category = ClassroomCategory.new(name: "Heavy Metal Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Heavy Metal Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 6 BLUES GUITAR
    file = URI.open('https://cdn.britannica.com/14/188114-050-509AC2A7/American-BB-King.jpg')
    @classroom_category = ClassroomCategory.new(name: "Blues Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Blues Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 7 ARCHTOP GUITAR
    file = URI.open('https://ak7.picdn.net/shutterstock/videos/10569557/thumb/4.jpg?ip=x480')
    @classroom_category = ClassroomCategory.new(name: "Archtop Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Archtop Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 8 Twelve-String GUITAR
    file = URI.open('https://upload.wikimedia.org/wikipedia/commons/7/76/Tuning_the_12-string_-_accordare_due_mani_chitarra.jpg')
    @classroom_category = ClassroomCategory.new(name: "Twelve-String Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Twelve-String Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 9 Multi-Neck Guitar
    file = URI.open('https://i.ytimg.com/vi/uQgc_VQPG9I/maxresdefault.jpg')
    @classroom_category = ClassroomCategory.new(name: "Multi-Neck Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Multi-Neck Guitar.png', content_type: 'image/png')
    @classroom_category.save!


    # 10 Resonator GUITAR
    file = URI.open('https://www.musicianwave.com/wp-content/uploads/2021/08/Resonator-Guitar-1536x1152.jpg')
    @classroom_category = ClassroomCategory.new(name: "Resonator Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Resonator Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 11 Harp Guitar
    file = URI.open('https://i.ytimg.com/vi/0FF-Q4gP_50/maxresdefault.jpg')
    @classroom_category = ClassroomCategory.new(name: "Harp Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Harp Guitar.png', content_type: 'image/png')
    @classroom_category.save!

    # 12 Pocket Guitar
    file = URI.open('https://i.pinimg.com/originals/46/49/d8/4649d84fb38ad04155154505bb85f84f.jpg')
    @classroom_category = ClassroomCategory.new(name: "Pocket Guitar", instrument: @instrument)
    @classroom_category.photo.attach(io: file, filename: 'Pocket Guitar.png', content_type: 'image/png')
    @classroom_category.save!


    # CLASSROOMS
    # 1
    file = URI.open('https://res.cloudinary.com/dofortjqc/image/upload/v1663164374/Screenshot_210_rwrchs.png')
    @classroom = Classroom.new(name: "Life and Music", description:"Vlad Postolachi", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Life and Music.png', content_type: 'image/png')
    @classroom.save!

    # 2
    file = URI.open('https://i.pinimg.com/236x/2c/5c/3f/2c5c3fdd75c0c10b3d8d519caf9a7754--funny-lizards-funny-animal-pictures.jpg')
    @classroom = Classroom.new(name: "Hard Rock Life", description:"Camilla Modena", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Hard Rock Life.png', content_type: 'image/png')
    @classroom.save!

    # 3
    file = URI.open('https://guitaradvice.com/wp-content/uploads/2021/08/Guitar-power-boat.jpg')
    @classroom = Classroom.new(name: "My Amigos", description:"Luca Severo", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'My Amigos.png', content_type: 'image/png')
    @classroom.save!

    # 4
    file = URI.open('https://i.pinimg.com/originals/8f/4a/98/8f4a981fde83f53740b6e083729d3928.jpg')
    @classroom = Classroom.new(name: "Low and Slow", description:"Chris Rundell", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Low and Slow.png', content_type: 'image/png')
    @classroom.save!

    # 5
    file = URI.open('https://ak3.picdn.net/shutterstock/videos/1014841363/thumb/1.jpg?ip=x480')
    @classroom = Classroom.new(name: "Music With Balls", description:"João Sanches", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'João Sanches.png', content_type: 'image/png')
    @classroom.save!

    # 6
    file = URI.open('https://media.istockphoto.com/photos/playing-slide-guitar-with-a-banana-going-bananas-concept-picture-id1206026224?k=20&m=1206026224&s=170667a&w=0&h=HkVbtT2aqxQDKefMWJSynZy5H6S9s3W_oySzliFkNPg=')
    @classroom = Classroom.new(name: "Music and Banana", description:"André R. Ferrer", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'André R. Ferrer.png', content_type: 'image/png')
    @classroom.save!

    # 7
    file = URI.open('http://sc04.alicdn.com/kf/HTB1MG0.A1uSBuNjSsplq6ze8pXaZ.jpg')
    @classroom = Classroom.new(name: "Cupcake and Music", description:"Jess Silva Carvalho", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Jess Silva Carvalho.png', content_type: 'image/png')
    @classroom.save!

    # 8
    file = URI.open('https://thumbs.dreamstime.com/b/funny-animal-chipmunk-guitar-like-singer-white-166160011.jpg')
    @classroom = Classroom.new(name: "Girl on Fire", description:"Anastasiya Kim", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Anastasiya Kim.png', content_type: 'image/png')
    @classroom.save!

    # 9
    file = URI.open('https://media.baamboozle.com/uploads/images/1399/1564544774_223225')
    @classroom = Classroom.new(name: "Clever Cats", description:"Xiǎo Xióng", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Clever Cats.png', content_type: 'image/png')
    @classroom.save!

    # 10
    file = URI.open('https://i.pinimg.com/originals/b3/23/34/b32334f6f097016633ecfe15e2abe62f.jpg')
    @classroom = Classroom.new(name: "The the philosophers", description:"Sen Cao", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Sen Cao.png', content_type: 'image/png')
    @classroom.save!

    # 11
    file = URI.open('https://external-preview.redd.it/UfMDSTiua6DgMA9NYEThsc56XzAhkda3CJ7DHSt6fxU.jpg?auto=webp&s=969cc9cbb6c63c1e2428eafce635d2aba194520d')
    @classroom = Classroom.new(name: "Laugh n’ Learn", description:"Federica Di Vincenzo", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Federica Di Vincenzo.png', content_type: 'image/png')
    @classroom.save!

    # 12
    file = URI.open('https://preview.redd.it/882uz84pnjt41.jpg?auto=webp&s=6188e68e4935073861fffc15bd0ea0e9d06481de')
    @classroom = Classroom.new(name: "The Cool Nerds", description:"Marcin Niemiec", level:["Beginner", "Intermediate", "Advanced"].sample, start_date:Faker::Date.in_date_period(month: 2), end_date: Faker::Date.in_date_period(month: 3),
    max_number_of_partecipants: rand(1..10), time: rand(1..6), language: Faker::Nation.language, user: user, classroom_category:@classroom_category)
    @classroom.photo.attach(io: file, filename: 'Marcin Niemiec.png', content_type: 'image/png')
    @classroom.save!

  end
  i += 1
end

12.times do
  Skill.create!(
    level: levels.sample,
    user: user,
    list: @list
  )
end

Booking.create!(
  user: user,
  classroom: @classroom
)

puts "DB ready 👌"
