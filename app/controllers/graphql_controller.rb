class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user
    }
    result = LandbnbSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private

  def current_user
    return nil if request.headers['Authorization'].blank?
    token = request.headers['Authorization'].split(' ').last
    return nil if token.blank?
    AuthToken.verify(token)
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end
end
