module RedmineAuthorFilter
  module ProjectAuthorsPatch
    def self.included(base) # :nodoc:
      base.send(:include, InstanceMethods)

      base.class_eval do
        alias_method_chain :initialize_available_filters, :all_project_authors
      end
    end

    module InstanceMethods
      private

      def initialize_available_filters_with_all_project_authors
        initialize_available_filters_without_all_project_authors

        if project
          author_values = []
          author_values << ["<< #{l(:label_me)} >>", "me"] if User.current.logged?

          from_user = []
          project.issues.group(:author_id).each{|i| from_user << [i.author.name, i.author_id.to_s]}
          from_user.uniq!
          from_user.sort!
          author_values += from_user

          add_available_filter('author_id', type: :list, values: author_values) unless author_values.empty?
        end
      end
    end
  end
end
