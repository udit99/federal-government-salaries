class SalariesController < ApplicationController
  VALID_PARAMS = [:division, :state_or_country, :county, :agency, :job_title]

  def index
    grouped = Salary.where(conditions_hash).group_by_segment
    render json: grouped.to_json
  end


  private

  def conditions_hash
    safe_params = params.slice(*VALID_PARAMS)
    safe_params.inject({}) do|hash, kv_pair|
      hash[kv_pair[0]] = kv_pair[1] if kv_pair[1].present?
      hash
    end
  end
end
