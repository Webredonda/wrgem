require 'rubygems'
require 'sitemap_generator'
SitemapGenerator::Sitemap.default_host = "http://PROJECT_NAME.com.br/"
SitemapGenerator::Sitemap.sitemaps_host = "http://s3-sa-east-1.amazonaws.com/PROJECT_NAME/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new


SitemapGenerator::Sitemap.create do

  # add '/contato', :priority => 0.7, :changefreq => 'daily'
  add '/', :priority => 1, :changefreq => 'daily'

  # Admin::Article.find_each do |article|
  #   add noticia_path(article), :lastmod => article.updated_at
  # end

end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks

