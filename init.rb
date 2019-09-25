require 'redmine_issues_search_filters/search_fetcher_patch'
require 'redmine_issues_search_filters/search_controller_patch'

Rails.configuration.to_prepare do
  unless Redmine::Search::Fetcher.included_modules.include? RedmineIssuesSearchFilters::SearchFetcherPatch
    Redmine::Search::Fetcher.prepend(RedmineIssuesSearchFilters::SearchFetcherPatch )
  end

  unless SearchController.included_modules.include? RedmineIssuesSearchFilters::SearchControllerPatch
    SearchController.prepend(RedmineIssuesSearchFilters::SearchControllerPatch)
  end
end

Redmine::Plugin.register :redmine_issues_search_filters do
  name 'Redmine Issues Search Filters plugin'
  author 'Roberto Piccini'
  description 'add the issues filters to the search'
  version '2.0.0'
  url 'https://github.com/piccio/redmine_issues_search_filter'
  author_url 'https://github.com/piccio'
end
