module RedmineAuthorFilter
  module ProjectAuthorsPatch

    private

    def initialize_available_filters
      super

      if project
        author_values = []
        author_values << ["<< #{l(:label_me)} >>", "me"] if User.current.logged?

        from_user = []
        project.issues.select(:author_id).group(:author_id).each{|i| from_user << [i.author.name, i.author_id.to_s]}
        from_user.uniq!
        from_user.sort!
        author_values += from_user

        add_available_filter('author_id', type: :list, values: author_values) unless author_values.empty?
      end
    end
  end
end
