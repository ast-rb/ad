module AdsHelper

def state_edit_ad(ad)
  if ad.state == 'draft' or ad.state == 'new'
    link_to 'Edit', edit_ad_path(ad)
  end
end

def status_destroy_ad(ad)
  if ad.status == 'draft' or ad.status == 'new'
    link_to 'Destroy', ad, confirm: 'Are you sure?', method: :delete
  end
end




end
