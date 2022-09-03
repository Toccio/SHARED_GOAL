require 'faker'

puts "Creating database"
Skill.destroy_all
List.destroy_all
Message.destroy_all
User.destroy_all
Classroom.destroy_all
Booking.destroy_all
puts "Database created 👌"


# instruments = {
#   Guitar: "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3VpdGFyfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
#   Piano: "https://media.istockphoto.com/photos/favorite-classical-musicclose-up-view-of-gentle-female-hands-playing-picture-id1129332575?k=20&m=1129332575&s=612x612&w=0&h=DTpOnAdbtHwbC60LMOpSOlMOogOPg8wyyIRvJzwJtc8=",
#   Drum: "https://media.istockphoto.com/photos/drummer-playing-drums-on-stage-picture-id499754206?k=20&m=499754206&s=612x612&w=0&h=1xzdpUnY9Rgv2-otasW2RKhhI4ryE1yuGXlFtyyuRyg=",
#   Violin: "https://images.immediate.co.uk/production/volatile/sites/24/2021/03/when-was-the-violin-invented-2ccbe78.jpg"
# }

levels = ["Beginner", "Intermediate", "Advanced"]

user = User.create!(
  email: "scheggia1190@gmail.com",
  password:"123456",
  first_name: Faker::Games::Heroes.name,
  last_name: Faker::Creature::Bird.common_family_name,
  nickname: Faker::Games::Pokemon.name,
)

list_category = [
  "Music", "Web Development", "Photography", "Animation",
  "Graphic Design", "Illustration", "Personal Development", "Creative Writing",
  "Film & Video", "UI/UX Design", "Fine Art", "Marketing", "Leadership & Management",
  "Freelance & Entrepreneurship","Business Analytics"
]

instruments = [
  "Trumpet", "Flute", "Ukelele", "Harmonica", "Cello", "Organ", "Clarinet", "Oboe", "Saxophone",
  "Guitar", "Piano", "Violin", "Harp", "Banjo", "Accordion"
]
# electric_guitars = {
#   "Guitar beginner" => "https://www.youtube.com/embed/HNSaXAe8tyg?controls=0",
#   "Guitar intermediate" => "https://www.youtube.com/embed/hEKexrWq5RU?controls=0",
#   "Guitar advanced" => "https://www.youtube.com/embed/Cda88AP_hjc?controls=0"
# }

# guitars = ["Acoustic guitar", "Electric guitar", "Bass guitar", "Classical guitar"]

i = 0
15.times do
  @list = List.create!(
    name: list_category[i],
    description: "Put the description",
    photo: Faker::LoremFlickr.image(size: "358x100", search_terms: ['sports'])
  )
  15.times do
    @classroom = Classroom.create!(
      name: instruments.sample,
      description: "Class description",
      category: %w[Music Fitness Languages Hiking Gardening].sample,
      start_date: Faker::Date.in_date_period(month: 2),
      end_date: Faker::Date.in_date_period(month: 3),
      address: Faker::Address.full_address,
      max_number_of_partecipants: rand(1..10),
      language: Faker::Nation.language,
      level: levels.sample,
      time: rand(1..6),
      user: user,
      list: @list
    )
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
