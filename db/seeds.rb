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

board1 = Board.create(user_id: user1.id, team_id: team1.id, name:"Projecto TPI", color:"#A6DD9B", is_public: true)
board2 = Board.create(user_id: user2.id, name:"Buk App", color:" #EABEB0", is_public: true)
board3 = Board.create(user_id: user3.id, name:"Personal", color:"#9BB8D3", is_public: true)
board4 = Board.create(user_id: user1.id, name:"Universidad", color:"#ea0f6b", is_public: true)
board5 = Board.create(user_id: user1.id, name:"Business", color:"#c4d8e2", is_public: true)
board6 = Board.create(user_id: user1.id, name:"Gimnasio", color:"#009e0f", is_public: true)
board7 = Board.create(user_id: user1.id, name:"Web Technologies", color:"#c4008c", is_public: true)
board8 = Board.create(user_id: user1.id, name:"Sistemas Embebidos", color:"#0051ba", is_public: true)
board9 = Board.create(user_id: user1.id, name:"Modelos Estocásticos", color:"#35c4af", is_public: true)
board10 = Board.create(user_id: user1.id, name:"Banchile", color:"#cc0c00", is_public: true)


states1 = (1..4).map do |position|
  board1.states.create(name: "State #{position}", position: position)
end

states2 = (1..4).map do |position|
  board2.states.create(name: "State #{position}", position: position)
end

states3 = (1..4).map do |position|
  board3.states.create(name: "State #{position}", position: position)
end

5.times do |i|
  Task.create(
    state_id: states1.sample.id,
    informer_user_id_id: user1.id,
    assignee_user_id_id: [user1.id, user2.id, user3.id].sample,
    name: "Task #{i+1}",
    priority: rand(1..3),
    description: "Esta es la descripción de la task #{i+1}",
    label_id: Label.create(user_id: user1.id, board_id: board1.id, name: "label #{i+1}", color: "#F89865")).id
end

5.times do |i|
  Task.create(
    state_id: states2.sample.id,
    informer_user_id_id: user2.id,
    assignee_user_id_id: [user1.id, user2.id, user3.id].sample,
    name: "Task #{i+1}",
    priority: rand(1..3),
    description: "Esta es la descripción de la task #{i+1}",
    label_id: Label.create(user_id: user2.id, board_id: board2.id, name: "label #{i+1}", color: "#F89865")).id
end

5.times do |i|
  Task.create(
    state_id: states3.sample.id,
    informer_user_id_id: user3.id,
    assignee_user_id_id: [user1.id, user2.id, user3.id].sample,
    name: "Task #{i+1}",
    priority: rand(1..3),
    description: "Esta es la descripción de la task #{i+1}",
    label_id: Label.create(user_id: user3.id, board_id: board3.id, name: "label #{i+1}", color: "#F89865")).id
end

UserTeam.create(user_id: 1, team_id: 1)
UserTeam.create(user_id: 2, team_id: 1)
UserTeam.create(user_id: 3, team_id: 1)
