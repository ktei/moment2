module ApplicationHelper
  def css_by_flash_key(key)
    return 'info' if key == :notice
    return 'danger' if key == :error
    return key.to_s
  end
end
