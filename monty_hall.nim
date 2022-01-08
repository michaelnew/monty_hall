import std/random

randomize()

let trials = 100000

var original_door_correct_count = 0
var remaining_door_correct_count = 0

while original_door_correct_count + remaining_door_correct_count < trials:
  let prize_door = rand(1..3)
  let contestant_choice = rand(1..3)
  let host_choice = rand(1..3)

  # The only valid game state is if the host randomly chooses the non-prize door
  # If they choose the contestants door or the prize door, re-run the simulation
  if host_choice != contestant_choice and host_choice != prize_door:
    if contestant_choice == prize_door: original_door_correct_count += 1
    else: remaining_door_correct_count += 1

echo "Running the simulation " & $trials & " times"
echo $original_door_correct_count & " # of times the contestan'ts originally chosen door contained the prize"
echo $remaining_door_correct_count & " # of times the remaining door contained the prize"
