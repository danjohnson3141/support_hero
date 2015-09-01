# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
heroes = [
	{first_name: 'Sherry', last_name: 'Sherrison', title: 'Suport Hero III', bio: 'Support specialist for over 20 years.'},
	{first_name: 'Boris', last_name: 'Karloff', title: 'Suport Hero II', bio: 'Boris Karloff was an English-born actor who played the monster in Frankenstein and became synonymous with horror films of the 1930s.'},
	{first_name: 'Vicente', last_name: 'Fox', title: 'Suport Hero Manager', bio: 'Vicente Fox Quesada is a Mexican businessman who was President of Mexico from 1 December 2000, to 30 November 2006 under the National Action Party.'},
	{first_name: 'Matte', last_name: 'Smith', title: 'Time Lord', bio: ''},
	{first_name: 'Kevin', last_name: 'Smith', title: 'Support Hero I', bio: ''},
	{first_name: 'Zoe', last_name: 'Smith', title: 'Support Hero I', bio: ''},
	{first_name: 'Jay', last_name: 'Jonah Jameson', title: 'Staff Writer', bio: ''},
	{first_name: 'Eadon', last_name: 'Smith', title: 'Support Hero I', bio: ''},
	{first_name: 'Franky', last_name: 'Stien', title: 'Support Hero IV', bio: ''},
	{first_name: 'Luis', last_name: 'CK', title: 'Support Hero I', bio: 'Support team comic support.'},
]

puts 'Seeding heroes...'
heroes.each do |hero|
	Hero.find_or_create_by(first_name: hero[:first_name], last_name: hero[:last_name]).update_attributes(hero)
end

schedules = ['Sherry', 'Boris', 'Vicente', 'Matte', 'Jack', 'Sherry',
 'Matte', 'Kevin', 'Kevin', 'Vicente', 'Zoe', 'Kevin',
 'Matte', 'Zoe', 'Jay', 'Boris', 'Eadon', 'Sherry',
 'Franky', 'Sherry', 'Matte', 'Franky', 'Franky', 'Kevin',
 'Boris', 'Franky', 'Vicente', 'Luis', 'Eadon', 'Boris',
 'Kevin', 'Matte', 'Jay', 'James', 'Kevin', 'Sherry',
 'Sherry', 'Jack', 'Sherry', 'Jack']

puts 'Seeding hero_schedules...'
scheduled_on = Time.now
schedules.each do |schedule|
	hero = Hero.find_by(first_name: schedule)
	HeroSchedule.create(hero: hero, scheduled_on: scheduled_on) if hero.present?
	scheduled_on += 1.days
end