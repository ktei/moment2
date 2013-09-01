class Album < ActiveRecord::Base
  belongs_to :user

  validates :caption, :presence => true, :length => { :maximum => 150 }
  validates_uniqueness_of :caption, :case_sensitive => false
  validates :user_id, :presence => true
  validates :description, :length => { :maximum => 500 }

  default_scope { order('albums.created_at DESC') }

  def cover

  end
end