require'faker'

puts 'Creating database'
List.destroy_all
Skill.destroy_all
Classroom.destroy_all
Booking.destroy_all
User.destroy_all
puts 'Database created'


# instruments = {
#   Guitar: "https://images.unsplash.com/photo-1510915361894-db8b60106cb1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z3VpdGFyfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
#   Piano: "https://media.istockphoto.com/photos/favorite-classical-musicclose-up-view-of-gentle-female-hands-playing-picture-id1129332575?k=20&m=1129332575&s=612x612&w=0&h=DTpOnAdbtHwbC60LMOpSOlMOogOPg8wyyIRvJzwJtc8=",
#   Drum: "https://media.istockphoto.com/photos/drummer-playing-drums-on-stage-picture-id499754206?k=20&m=499754206&s=612x612&w=0&h=1xzdpUnY9Rgv2-otasW2RKhhI4ryE1yuGXlFtyyuRyg=",
#   Violin: "https://images.immediate.co.uk/production/volatile/sites/24/2021/03/when-was-the-violin-invented-2ccbe78.jpg"
# }

levels = ["Beginner", "Intermediate", "Advanced"]


1.times do
  User.create!(
    email: "scheggia1190@gmail.com",
    password:"123456",
    avatar: Faker::Avatar.image
  )
end


4.times do
  List.create!(
    name: Faker::Music.instrument,
    description: "Put the description"
  )
end

4.times do
  Skill.create!(
    level: levels.sample,
  )
end

4.times do
  Classroom.create!(
    name: Faker::Music.band,
    description: "Class description",
    start_date: Faker::Date.in_date_period(month: 2),
    end_date: Faker::Date.in_date_period(month: 3),
    address: Faker::Address.full_address,
    max_number_of_partecipants: rand(1..10),
    language: Faker::Nation.language,
    level: levels.sample,
    time: rand(1..6)
  )
