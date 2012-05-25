class Team < ActiveRecord::Base
  attr_accessible :country, :draw, :group_cd, :last_16, :last_2, :last_4, :last_8, :lost, :place, :won
end
