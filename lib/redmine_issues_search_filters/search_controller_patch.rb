module RedmineIssuesSearchFilters
  module SearchControllerPatch

    def index
      SearchController.helper(:queries)

      # the 'top-right search' doesn't have filters and searches only over open issues,
      # the 'extended search' since it has filters enabled and since it removes the default 'Status = open' filter
      # (see above) it searches over all issues.
      # in this way also the 'top-right search' searches over all issues.
      params['f'] = [''] unless params.has_key?('f')

      issue_params = params.to_unsafe_h.symbolize_keys
      issue_params[:project_id] = params[:id] if params.has_key?(:id)

      issue_query = IssueQuery.new(name: 'piccio', project: @project)
      # remove the default 'Status = open' filter
      issue_query.filters.delete('status_id')
      @query = issue_query.build_from_params(issue_params)

      super
    end

  end
end
