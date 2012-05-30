class Invitation < ActiveRecord::Base
  attr_accessible :accepted_at, :guest_id, :request_id, :user_id
  
  #validations
  validates :user_id, :presence => true
  validates :request_id, :presence => true
  
  def self.save_invitations(user, request_ids)
    request_ids = request_ids.split(',')
    request_ids.each do |request_id|
      inv = Invitation.find_by_guest_id_and_request_id(user.facebook_idx, request_id)
      if inv
        inv.accepted_at ||= Time.now
        inv.save!
      end
    end
  end
  
  
end
