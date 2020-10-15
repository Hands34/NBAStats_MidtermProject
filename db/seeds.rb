# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv" # Import the CSV library that comes with ruby
require "faker"

# Remove all data to start.
Mascot.delete_all
PlayerPosition.delete_all
Position.delete_all
Player.delete_all
Team.delete_all
College.delete_all

# filename = File.join(Rails.root, "db", "player_stats.csv")
filename = Rails.root.join("db/players_stats.csv")
puts "Loading Player Data From: #{filename}"
player_data = File.read(filename)
players = CSV.parse(player_data, headers: true)

puts "Loaded #{players.size} rows from the CSV file."

players.each do |p|
  team = Team.find_or_create_by(name: p["Team"])
  college = College.find_or_create_by(name: p["College"])

  if team&.valid? && college&.valid?
    # Create the player
    player = team.players.create(
      full_name:    p["Name"],
      games_played: p["Games Played"],
      minutes:      p["MIN"],
      points:       p["PTS"],
      rebounds:     p["REB"],
      assists:      p["AST"],
      steals:       p["STL"],
      blocks:       p["BLK"],
      turnovers:    p["TOV"],
      age:          p["Age"],
      birth_place:  p["Birth_Place"],
      position:     p["Pos"],
      college:      college
    )

    unless player.valid?
      puts "Invalid player #{p['Name']}"
      next
    end
    # puts player.errors.messages
    positions = p["Pos"].split(",")
    positions.each do |position|
      pos = Position.find_or_create_by(name: position)

      unless pos.valid?
        puts "Invalid Position: #{position} for player: #{player.name}"
        next
      end
      PlayerPosition.create(player: player, position: pos)
    end

  else
    puts "Invalid team #{p['Team']}for player #{p['Name']}."
    # puts team.errors.messages
    puts "Invalid College #{p['College']} for player #{p['Name']}."
    # puts college.errors.messages
  end
end

teams = Team.all
teams.each do |t|
  Mascot.create(
    name: Faker::Name.unique.name,
    team: t
  )
end

# 30.times do
#   Mascot.create(
#     name: Faker::Name.unique.name
#   )
# end

puts "Created #{Team.count} Teams"
puts "Created #{College.count} Colleges"
puts "Created #{Player.count} Players"
puts "Created #{Position.count} Positions"
puts "Created #{PlayerPosition.count} Player Positions"
puts "Created #{Mascot.count} Mascots"
