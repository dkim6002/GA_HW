log = [
  {time: 201201, x: 2},
  {time: 201201, y: 7},
  {time: 201201, z: 2},
  {time: 201202, a: 3},
  {time: 201202, b: 4},
  {time: 201202, c: 0}
]
 

compress = log.group_by { |time| time[:time] }.map {|key, value| value.reduce(:merge)}

puts compress