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

file = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg')
classroom = Classroom.new(name: "Topo Gigio")
classroom.photo.attach(io: file, filename: 'topo.png', content_type: 'image/png')

levels = ["Beginner", "Intermediate", "Advanced"]

user = User.create!(
  email: "scheggia1190@gmail.com",
  password:"123456",
  first_name: Faker::Games::Heroes.name,
  last_name: Faker::Creature::Bird.common_family_name,
  nickname: Faker::Games::Pokemon.name
)

list_category = [
  "Music", "Web Development", "Photography", "Animation",
  "Graphic Design", "Illustration", "Personal Development", "Creative Writing",
  "Film & Video", "UI/UX Design", "Fine Art", "Marketing", "Leadership & Management",
  "Entrepreneurship","Business Analytics"
]

instruments = [
  "Trumpet", "Flute", "Ukelele", "Harmonica", "Cello", "Organ", "Clarinet", "Oboe", "Saxophone",
  "Piano", "Violin", "Harp", "Banjo", "Accordion", "Guitar"
]

guitars = [
  "Acoustic guitar", "Electric guitar", "Bass guitar", "Classical guitar",
  "Rock'n'Roll guitar", "Hard Rock guitar", "Heavy Metal", "Funk guitar",
  "Reggae guitar", "Country guitar", "Jazz guitar", "Blues guitar",
  "Pop guitar", "Le Wagon guitar", "Italian classic guitar"
]

classes = {
  "Topo Gigio" => "Vlad Postolachi", "Bla bla" => "Camilla Modena",
  "Cool" => "Chris Rundell" , "God Father" => "João Sanches",
  "Rock'n'Roll" => "Anastasiya Kim", "Hard Rock" => "Sen Cao",
  "Heavy Metal" => "Marcin Niemiec", "Funk" => "Filippos Lavrentidis",
  "Reggae" => "Xiǎo Xióng", "Country" => "Federica Di Vincenzo",
  "Jazz" => "Super Mario", "Blues" => "André R. Ferrer",
  "Pop" => "Jess Silva Carvalho", "Le Wagon" => "Daniel Leonardo Hong",
  "Italian classic" => "Lusa Severo"
}

i = 0
5.times do
  @list = List.create!(
    name: list_category[i],
    description: "Put the description",
    photo: Faker::LoremFlickr.image(size: "358x100", search_terms: ['sports'])
  )
  if @list.name == "Music"
    instruments.each do |instrument|
      @instrument = Instrument.create!(
        name: instrument,
        list: @list
      )
    end
  end
  if @list.name == "Music"
      guitars.each do |guitar|
        @classroom_category = ClassroomCategory.create!(
        name: guitar,
        instrument: @instrument
      )
    end
  end
  if @list.name == "Music"
    classes.each do |key, value|
      @classroom = Classroom.create!(
        name: key,
        description: value,
        category: %w[Music Fitness Languages Hiking Gardening].sample,
        start_date: Faker::Date.in_date_period(month: 2),
        end_date: Faker::Date.in_date_period(month: 3),
        address: Faker::Address.full_address,
        max_number_of_partecipants: rand(1..10),
        language: Faker::Nation.language,
        level: levels.sample,
        time: rand(1..6),
        user: user,
        classroom_category: @classroom_category,
      )
    end
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
