# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

TaskComment.delete_all
Task.delete_all
State.delete_all
Label.delete_all
UserBoard.delete_all
UserTask.delete_all
UserTeam.delete_all

Team.all.each do |team|
  team.boards.destroy_all
end

Team.delete_all
Board.delete_all
User.delete_all


user1 = User.create(
  name: 'Pedro Villegas',
  email: 'ppvillegas@miuandes.cl',
  password: 'despuesteladigo123',
)

user2 = User.create(
  name: 'Benjamin Valenzuela',
  email: 'bnvalenzuela@miuandes.cl',
  password: 'cr7stk',
)

user3 = User.create(
  name: 'Rodrigo Orellana',
  email: 'rrorellana@miuandes.cl',
  password: 'Rorro123',
)

team1 = Team.create(name:"grupo17")

board1 = Board.create(user_id: user1.id, team_id: team1.id, name:"tablero17", color:"#B820D6", is_public: true)
board2 = Board.create(user_id: user2.id, name:"tablero18", color:"#20D65F", is_public: true)
board3 = Board.create(user_id: user3.id, name:"tablero19", color:"#5720D6", is_public: true)

states1 = (1..4).map do |position|
  board1.states.create(name: "estado#{position}", position: position)
end

states2 = (1..4).map do |position|
  board2.states.create(name: "estado#{position}", position: position)
end

states3 = (1..4).map do |position|
  board3.states.create(name: "estado#{position}", position: position)
end

5.times do |i|
  Task.create(
    state_id: states1.sample.id,
    informer_user_id_id: user1.id,
    assignee_user_id_id: [user1.id, user2.id, user3.id].sample,
    name: "Tarea#{i+1}",
    priority: rand(1..3),
    description: "Esta es la descripción de la tarea #{i+1}",
    label_id: Label.create(user_id: user1.id, board_id: board1.id, name: "label#{i+1}", color: "#F89865 ").id
  )
end

5.times do |i|
  Task.create(
    state_id: states2.sample.id,
    informer_user_id_id: user2.id,
    assignee_user_id_id: [user1.id, user2.id, user3.id].sample,
    name: "Tarea#{i+1}",
    priority: rand(1..3),
    description: "Esta es la descripción de la tarea #{i+1}",
    label_id: Label.create(user_id: user2.id, board_id: board2.id, name: "label#{i+1}", color: "#000000").id
  )
end

5.times do |i|
  Task.create(
    state_id: states3.sample.id,
    informer_user_id_id: user3.id,
    assignee_user_id_id: [user1.id, user2.id, user3.id].sample,
    name: "Tarea#{i+1}",
    priority: rand(1..3),
    description: "Esta es la descripción de la tarea #{i+1}",
    label_id: Label.create(user_id: user3.id, board_id: board3.id, name: "label#{i+1}", color: "#FF0068").id
  )
end
