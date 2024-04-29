class ApplicationController < ActionController::API
  include Authentication
  rescue_from QueryBuilderError, with: :builder_error
  rescue_from RepresentationBuilderError, with: :builder_error
  rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

  protected

  def builder_error(error)
    render status: 400, json: {
      error: {
        type: error.class,
        message: error.message,
        invalid_params: error.invalid_params
      }
    }
  end

  def unprocessable_entity!(resource)
    render status: :unprocessable_entity, json: {
      error: {
        message: "Invalid parameters for resource #{resource.class}.",
        invalid_params: resource.errors
      }
    }
  end

  def orchestrate_query(scope, actions = :all)
    QueryOrchestrator.new(scope: scope,
      params: params,
      request: request,
      response: response,
      actions: actions).run
  end

  def serialize(data, options = {})
    {
      json: Booksy::Serializer.new(data: data,
        params: params,
        actions: [:fields, :embeds],
        options: options).to_json
    }
  end

  def resource_not_found
    render(status: 404)
  end
end
