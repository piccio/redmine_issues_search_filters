module RedmineIssuesSearchFilters
  module SearchControllerPatch

    def index
      SearchController.helper(:queries)

      issue_params = params.symbolize_keys
      issue_params[:project_id] = params[:id] if params.has_key?(:id)

      issue_query = IssueQuery.new(name: 'piccio', project: @project)
      issue_query.filters.delete('status_id')
      @query = issue_query.build_from_params(issue_params)

      super
    end

  end
end
