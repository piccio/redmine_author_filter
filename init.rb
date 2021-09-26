require 'redmine_author_filter/project_authors_patch'

unless IssueQuery.included_modules.include? RedmineAuthorFilter::ProjectAuthorsPatch
  IssueQuery.prepend(RedmineAuthorFilter::ProjectAuthorsPatch)
end

Redmine::Plugin.register :redmine_author_filter do
  name 'Redmine Author Filter plugin'
  author 'Roberto Piccini'
  description "it allows issues' filtering using all authors of the project's issues, not only the members of the project (http://www.redmine.org/issues/1875)"
  version '2.0.2'
  url 'https://github.com/piccio/redmine_author_filter'
  author_url 'https://github.com/piccio'
end
