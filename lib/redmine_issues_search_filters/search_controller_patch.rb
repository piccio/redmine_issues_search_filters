module RedmineIssuesSearchFilters
  module SearchControllerPatch

    def index
      SearchController.helper(:queries)

      issue_params = params.symbolize_keys
      issue_params[:project_id] = params[:id] if params.has_key?(:id)

      @query = IssueQuery.build_from_params(issue_params, name: 'piccio', project: @project)

      super
    end

  end
end
