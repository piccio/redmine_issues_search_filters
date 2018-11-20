module RedmineIssuesSearchFilters
  module SearchFetcherPatch

    private

    def load_result_ids
      results = super

      issue_params = @options[:params].symbolize_keys
      issue_params[:project_id] = @options[:params][:id] if @options[:params].has_key?(:id)

      project = Project.find(issue_params[:project_id]) unless issue_params[:project_id].blank?

      issue_query = IssueQuery.build_from_params(issue_params, name: 'piccio', project: project)

      issues = issue_query.issues

      results.select do |result|
        result.first == 'issues' && issues.map(&:id).include?(result.last) || result.first != 'issues'
      end
    end

  end
end