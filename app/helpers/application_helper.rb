module ApplicationHelper
  def css_by_flash_key(key)
    return 'info' if key == :notice
    return 'danger' if key == :error
    return key.to_s
  end

  def cancel_submit_link_btn(back_url = request.referrer)
    link_to 'Cancel', back_url, class: 'btn btn-default'
  end
end
