# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Board.delete_all
Label.delete_all
State.delete_all
TaskComment.delete_all
Task.delete_all
Team.delete_all
UserBoard.delete_all
UserTask.delete_all
UserTeam.delete_all
User.delete_all

User.create(
  name: 'Pedro Villegas',
  email: 'ppvillegas@miuandes.cl',
  password: 'despuesteladigo123',
)

User.create(
  name: 'Benjamin Valenzuela',
  email: 'bnvalenzuela@miuandes.cl',
  password: 'cr7stk',
)

User.create(
  name: 'Rodrigo Orellana',
  email: 'rrorellana@miuandes.cl',
  password: 'Rorro123',
)
