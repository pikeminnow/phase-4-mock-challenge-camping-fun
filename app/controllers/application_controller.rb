class ApplicationController < ActionController::API
  include ActionController::Cookies
rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found_response
rescue_from ActiveRecord::RecordInvalid, :with => :unprocessable_entity_response

private

def record_not_found_response(exception)
render json: "#{exception.model} not found" , status: :not_found
end


#I do not understand why what I'm doing results in the wrong quote character
#  1) Activities DELETE /activities/:id with an invalid ID returns an error message
# Failure/Error:
#   expect(response.body).to include_json({
  #     error: "Activity not found"
  #   })
  
  # JSON::ParserError:
  #   783: unexpected token at 'Activity not found'
  
  
  def unprocessable_entity_response(exception)
  render json: "#{exception.errors.full_messages}" , status: :invalid
  end
  

end
