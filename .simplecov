# https://github.com/colszowka/simplecov#using-simplecov-for-centralized-config

## DEFINE VARIABLES
@minimum_coverage = ENV.fetch('COVERAGE_MINIMUM') do
  case (defined?(RUBY_ENGINE) && RUBY_ENGINE) || 'ruby' # rubocop:disable Lint/LiteralInCondition
  when 'jruby', 'rbx'
    96.0
  else
    98.1
  end
end.to_f.round(2)

# rubocop:disable Style/DoubleNegation
ENV['FULL_BUILD'] ||= ENV['CI']
@running_ci       = !!(ENV['FULL_BUILD'] =~ /\Atrue\z/i)
@generate_report  = @running_ci || !!(ENV['COVERAGE'] =~ /\Atrue\z/i)
@output = STDOUT
# rubocop:enable Style/DoubleNegation

## CONFIGURE SimpleCov
SimpleCov.pid = $PROCESS_ID # In case there's any forking

## START TRACKING COVERAGE (before activating SimpleCov)
require 'coverage'
Coverage.start

SimpleCov.start 'rails' do
    add_filter 'spec'
end
