require 'redmine_author_filter/project_authors_patch'

unless IssueQuery.included_modules.include? RedmineAuthorFilter::ProjectAuthorsPatch
  IssueQuery.send(:include, RedmineAuthorFilter::ProjectAuthorsPatch)
end

Redmine::Plugin.register :redmine_author_filter do
  name 'Redmine Author Filter plugin'
  author 'Roberto Piccini'
  description "it allows issues' filtering using all authors of the project's issues, not only the members of the project (http://www.redmine.org/issues/1875)"
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  requires_redmine version: '2.6.0'
end
