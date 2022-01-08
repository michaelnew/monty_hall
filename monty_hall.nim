import std/random

randomize()

const trials = 1000000

# Run the simulation assuming the host has no knowledge of where the prize is
var original_door_correct_count = 0
var remaining_door_correct_count = 0

while original_door_correct_count + remaining_door_correct_count < trials:
  var doors = @[0,1,2]
  let prize_door = rand(0..2)
  let contestant_choice = rand(0..2)

  doors.delete(contestant_choice)
  let host_choice = doors[rand(0..1)]

  # The only valid game state is if the host randomly chooses the non-prize door
  # If the host chooses the door with the prize behind it, discard this game and run again
  if host_choice != prize_door:
    if contestant_choice == prize_door: original_door_correct_count += 1
    else: remaining_door_correct_count += 1

echo "Running the simulation " & $trials & " times where the host chooses doors randomly"
echo $original_door_correct_count & " # of times the contestant's originally chosen door contained the prize"
echo $remaining_door_correct_count & " # of times the remaining door contained the prize"


# This time simulate the host knowingly choosing a door without the prize
original_door_correct_count = 0
remaining_door_correct_count = 0

while original_door_correct_count + remaining_door_correct_count < trials:
  let prize_door = rand(0..2)
  let contestant_choice = rand(0..2)
  var host_choice = -1

  var doors = @[0,1,2]

  if contestant_choice != prize_door:
    doors.delete(contestant_choice)
    doors.delete(prize_door)
    host_choice = doors[0]
  else:
    doors.delete(contestant_choice)
    host_choice = doors[rand(0..1)]

  if contestant_choice == prize_door: original_door_correct_count += 1
  else: remaining_door_correct_count += 1

echo "\n\nRunning the simulation " & $trials & " times where the host intentionally chooses empty doors"
echo $original_door_correct_count & " # of times the contestan'ts originally chosen door contained the prize"
echo $remaining_door_correct_count & " # of times the remaining door contained the prize"
