class User < ActiveRecord::Base
  include Clearance::User

  has_many :albums, :dependent => :destroy

  validates :first_name,
            :length =>  { :maximum => 50 }

  validates :last_name,
            :length =>  { :maximum => 50 }

  has_attached_file :avatar,
                    :styles => { :profile => ["200x200#", :jpg], :thumb => ["40x40#", :jpg] }



end
