RSpec.shared_context "generic context", :shared_context => :metadata do
  let(:response_body) do 
    @response_body ||= JSON.load(response.body)
    @response_body.is_a?(Array) ? @response_body.map{|elem| elem.try(:with_indifferent_access) || elem  } : (@response_body.try(:with_indifferent_access) || @response_body)
  end
  let(:json_header) { 'application/json' }
  let(:default_request_headers) { { CONTENT_TYPE: json_header, ACCEPT: json_header} }
  let(:request_headers) { default_request_headers }                                                              
end