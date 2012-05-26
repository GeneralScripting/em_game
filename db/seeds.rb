# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.connection.execute('TRUNCATE TABLE teams')
Game.connection.execute('TRUNCATE TABLE games')

Time.zone = 'Berlin'

pl = Team.create!(:country => 'PL', :group => :a)
gr = Team.create!(:country => 'GR', :group => :a)
ru = Team.create!(:country => 'RU', :group => :a)
cz = Team.create!(:country => 'CZ', :group => :a)
nl = Team.create!(:country => 'NL', :group => :b)
pt = Team.create!(:country => 'PT', :group => :b)
de = Team.create!(:country => 'DE', :group => :b)
dk = Team.create!(:country => 'DK', :group => :b)
es = Team.create!(:country => 'ES', :group => :c)
it = Team.create!(:country => 'IT', :group => :c)
ir = Team.create!(:country => 'IE', :group => :c)
hr = Team.create!(:country => 'HR', :group => :c)
fr = Team.create!(:country => 'FR', :group => :d)
gb = Team.create!(:country => 'GB', :group => :d)
ua = Team.create!(:country => 'UA', :group => :d)
se = Team.create!(:country => 'SE', :group => :d)

#Spieltag 1
Game.create!(:team_a => pl, :team_b => gr, :group => :a, :start_at => Time.parse('2012-06-08 18:00'))
Game.create!(:team_a => ru, :team_b => cz, :group => :a, :start_at => Time.parse('2012-06-08 20:45'))
Game.create!(:team_a => nl, :team_b => dk, :group => :b, :start_at => Time.parse('2012-06-09 18:00'))
Game.create!(:team_a => de, :team_b => pt, :group => :b, :start_at => Time.parse('2012-06-09 20:45'))
Game.create!(:team_a => es, :team_b => it, :group => :c, :start_at => Time.parse('2012-06-10 18:00'))
Game.create!(:team_a => ir, :team_b => hr, :group => :c, :start_at => Time.parse('2012-06-10 20:45'))
Game.create!(:team_a => fr, :team_b => gb, :group => :d, :start_at => Time.parse('2012-06-11 18:00'))
Game.create!(:team_a => ua, :team_b => se, :group => :d, :start_at => Time.parse('2012-06-11 20:45'))
#Spieltag 2
Game.create!(:team_a => gr, :team_b => cz, :group => :a, :start_at => Time.parse('2012-06-12 18:00'))
Game.create!(:team_a => pl, :team_b => ru, :group => :a, :start_at => Time.parse('2012-06-12 20:45'))
Game.create!(:team_a => dk, :team_b => pt, :group => :b, :start_at => Time.parse('2012-06-13 18:00'))
Game.create!(:team_a => nl, :team_b => de, :group => :b, :start_at => Time.parse('2012-06-13 20:45'))
Game.create!(:team_a => it, :team_b => hr, :group => :c, :start_at => Time.parse('2012-06-14 18:00'))
Game.create!(:team_a => es, :team_b => ir, :group => :c, :start_at => Time.parse('2012-06-14 20:45'))
Game.create!(:team_a => ua, :team_b => fr, :group => :d, :start_at => Time.parse('2012-06-15 18:00'))
Game.create!(:team_a => se, :team_b => gb, :group => :d, :start_at => Time.parse('2012-06-15 20:45'))
#Spieltag 3
Game.create!(:team_a => gr, :team_b => ru, :group => :a, :start_at => Time.parse('2012-06-16 20:45'))
Game.create!(:team_a => cz, :team_b => pl, :group => :a, :start_at => Time.parse('2012-06-16 20:45'))
Game.create!(:team_a => pt, :team_b => nl, :group => :b, :start_at => Time.parse('2012-06-17 20:45'))
Game.create!(:team_a => dk, :team_b => de, :group => :b, :start_at => Time.parse('2012-06-09 20:45'))
Game.create!(:team_a => hr, :team_b => es, :group => :c, :start_at => Time.parse('2012-06-09 20:45'))
Game.create!(:team_a => it, :team_b => ir, :group => :c, :start_at => Time.parse('2012-06-09 20:45'))
Game.create!(:team_a => se, :team_b => fr, :group => :d, :start_at => Time.parse('2012-06-09 20:45'))
Game.create!(:team_a => gb, :team_b => ua, :group => :d, :start_at => Time.parse('2012-06-09 20:45'))

#1/4 Finale

#1/2 Finale

#Finale





