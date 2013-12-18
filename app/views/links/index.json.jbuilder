json.array! @link_lists do |link_list|
  json.id link_list.id
  json.url link_list.link.url
  json.created_at link_list.created_at
end