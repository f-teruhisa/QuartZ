json.extract! organization, :id, :name, :url, :image_url, :text, :created_at, :updated_at
json.url organization_url(organization, format: :json)
