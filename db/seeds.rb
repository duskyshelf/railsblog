# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create(title: 'Seeded Title', description: 'Seeded Description', username: 'Seed Person')
Post.create(title: '2nd Seeded Title', description: '2nd Seed', username: 'Person 2')
