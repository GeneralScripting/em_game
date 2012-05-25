class Team < ActiveRecord::Base
  attr_accessible :country, :draw, :group, :last_16, :last_2, :last_4, :last_8, :lost, :place, :won

  # relations

  # validations
  validates :country, :group, :presence => true

  # plugins
  as_enum :group, { :a => 0, :b => 1, :c => 2, :d => 3, :e => 4 }





end
