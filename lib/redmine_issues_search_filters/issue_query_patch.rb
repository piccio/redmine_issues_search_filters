module RedmineIssuesSearchFilters
  module IssueQueryPatch

    def initialize(attributes=nil, *args)
      super

      self.filters.delete('status_id')
    end

  end
end
