# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Message.delete_all

User.create([
  {
    name: 'bob',
    password: 'secret',
    password_confirmation: 'secret'
  },
  {
    name: 'ann',
    password: '123456',
    password_confirmation: '123456'
  },
  { name: 'jenny',
    password: 'password',
    password_confirmation: 'password'
  }
])

bob = User.find_by(name: 'bob')
ann = User.find_by(name: 'ann')
jenny = User.find_by(name: 'jenny')

bob.messages.create(body: 'Hello everyone!')
ann.messages.create(body: 'Hello bob, how are u?')
jenny.messages.create(body: 'Hey bob! nice to have you here with us :)')
