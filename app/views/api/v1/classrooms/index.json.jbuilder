json.array! @classrooms do |classroom|
  json.extract! classroom, :name, :id
end
