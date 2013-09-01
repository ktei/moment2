module AlbumsHelper
  def cover_for(album, size = :thumb)
    if size == :thumb
      image_tag 'http://placehold.it/200x150&text=Thumb', :alt => 'album'
    else
      image_tag 'http://placehold.it/200x150&text=Thumb', :alt => 'album'
    end
  end
end
