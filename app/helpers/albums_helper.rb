module AlbumsHelper
  def cover_for(album, size = :thumb)
    if size == :thumb
      image_tag 'http://placehold.it/200x150&text=Thumb', class: 'img-thumbnail', :alt => 'album'
    else
      image_tag 'http://placehold.it/200x150&text=Thumb', class: 'img-thumbnail', :alt => 'album'
    end
  end
end
