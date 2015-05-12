# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#############################################################
# ADD REVERSE RELATIONSHIPS TO MODELS
#############################################################
# Make sure you add these before running the seeds
#
# artist ==>
#   has_one :user_account
#   has_many :albums
#   has_many :songs, through: :albums
# album  ==>
#   has_many :songs
# song   ==>
#   belongs_to :artist, through: :albums


#############################################################
# INITIAL DATA
#############################################################
harry = Artist.create(name: "DJ Harry")
harry.create_user_account(email: "harry.chen@bieverFans.org")
harry.albums.create(title: "True Believer")
harry.albums.first.songs.create(name: "Baby baby babes")
harry.albums.first.songs.create(name: "I am your baby baby")

%w[harry
  harry.albums
  harry.albums.first.songs
  harry.songs
  UserAccount.first.artist.albums.first.songs
  UserAccount.first.artist.albums.first.songs.first.album.artist.user_account
].each do |command|
  puts "-"*80
  puts command
  result = eval "#{command}.inspect"
  puts result
end