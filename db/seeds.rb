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
ir = Team.create!(:country => 'IR', :group => :c)
hr = Team.create!(:country => 'HR', :group => :c)
fr = Team.create!(:country => 'FR', :group => :d)
gb = Team.create!(:country => 'GB', :group => :d)
ua = Team.create!(:country => 'UA', :group => :d)
se = Team.create!(:country => 'SE', :group => :d)

#Game.create!(:team_a => de, :team_b => pl, :group => :a, :start_at => Time.parse('2012-06-09 20:00'))
