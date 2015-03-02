lines = %w(4 5 6 A C E 1 2 3 7 B D F M G J Z L N Q R S)

lines.each do |line|
  Train.create(name: line) 
end

