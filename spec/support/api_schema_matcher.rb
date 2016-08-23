require 'json-schema'

RSpec::Matchers.define :match_response_schema do |schema|
  match do |response|
    JSON::Validator.validate!(schema_path(schema), response.body, strict: true)
  end

  def schema_path(schema)
    Rails.root.join('spec/support/api/schemas', schema)
  end
end
