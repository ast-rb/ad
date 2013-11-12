module AdsHelper

def state_edit_ad(ad)
  if ad.state == 'draft' || ad.state == 'archive'
    link_to 'Edit', edit_ad_path(ad)
  end
end

def state_destroy_ad(ad)
  unless ad.state == 'archive'
    link_to 'Destroy', ad, confirm: 'Are you sure?', method: :delete
  end
end




end
