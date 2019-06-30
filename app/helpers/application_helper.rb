# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      title:       "QuartZ",
      description: "QuartZ solves communication challenges in your organization with random lunch.",
      keywords:    "random,lunch,communication,team,organization",
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('top_image.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      noindex: ! Rails.env.production?,
	  canonical: request.original_url,
      charset: "UTF-8",
      og: {
        title: :title,
        description: :description,
        type: "website",
        url: request.original_url,
        image: image_url("top_image.png"),
        site_name: "site name",
        locale: "ja_JP"
      },
      twitter: {
        site: '@terry_i_',
        card: 'summary',
        image: image_url("top_image.png")
	  },
      fb: {
        app_id: '2334858459911814'
      }
    }
  end
end
