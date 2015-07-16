class GrantsParamsBuilder
  def initialize(params, user, type)
    @params = params
    @type = type
    @permitted_attributes = base + send(user.role) + send(type)
  end

  def params
    @params.require(@type.to_sym).permit(@permitted_attributes)
  end

  private

  def base
    [:title, :bank_account, :bank_account_name]
  end

  def admin
    reviewer_or_admin_params
  end

  def reviewer
    reviewer_or_admin_params
  end

  def registered
    []
  end

  def reviewer_or_admin_params
    [
      :status, :admin_reference_number, :admin_remarks, :admin_complete_and_checked,
      :admin_research_type, :admin_user_accepted, grant_attributes: [:archived, :id]
    ]
  end

  def foreign_grant
    [
      :everything_is_correct, :visit_type, :title, :goal, :visiting_institute,
      :city, :country, :research_questions, :research_type_id, :description,
      :learning_experience, :dutch_mentor, :foreign_mentor, :amount_covered,
      :amount_to_cover, :start_date, :end_date, :remarks, :research_deadline,
      :document
    ]
  end

  def research_grant
    [
      :summary, :motive, :research_questions, :working_method,
      :time_axle, :previous_publications, :project_responsibilities,
      :other_groups, :independent, :grant_amount, :grant_goal,
      :specific_support, :other_funds, :total_estimate, :remarks, :finish_date
    ]
  end

  def thesis_grant
    [
      :summary, :relevance_patients, :relevance_research, :research_questions,
      :research_type_id, :number_of_peer_reviewed_publications, :planned_number_of_prints,
      :planned_costs, :grant_leads_to_more_prints, :promotor, :co_promotor,
      :university, :start_date, :graduation_date, :remarks, :finish_date
    ]
  end
end
