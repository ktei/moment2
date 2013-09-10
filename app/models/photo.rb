class Photo < ActiveRecord::Base
  belongs_to :album

  validates :description, :length => { :maximum => 1000 }

  has_attached_file :image,
                    :styles => { :thumb => ["200x150#", :jpg], :display => ["800x600^", :jpg] }

  default_scope { order('photos.id DESC') }


end
