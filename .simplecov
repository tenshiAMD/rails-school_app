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

## ADD SOME CUSTOM REPORTING AT EXIT
SimpleCov.at_exit do
  next if $ERROR_INFO && !($ERROR_INFO.is_a?(SystemExit) && $ERROR_INFO.success?)

  header = "#{'*' * 20} SimpleCov Results #{'*' * 20}"
  results = SimpleCov.result.format!.join("\n")
  exit_message = <<-EOF

#{header}
{{RESULTS}}
{{FAILURE_MESSAGE}}

#{'*' * header.size}
  EOF
  percent = Float(SimpleCov.result.covered_percent)
  if percent < @minimum_coverage
    failure_message = <<-EOF
Spec coverage was not high enough: #{percent.round(2)}% is < #{@minimum_coverage}%
    EOF
    exit_message.sub!('{{RESULTS}}', results).sub!('{{FAILURE_MESSAGE}}', failure_message)
    @output.puts exit_message
    abort(failure_message) if @generate_report
  elsif @running_ci
    exit_message.sub!('{{RESULTS}}', results).sub!('{{FAILURE_MESSAGE}}', <<-EOF)
Nice job! Spec coverage (#{percent.round(2)}%) is still at or above #{@minimum_coverage}%
    EOF
    @output.puts exit_message
  end
end

## CAPTURE CONFIG IN CLOSURE 'CodeCoverage.start'
## to defer running until spec/spec_helper.rb is loaded.
module CodeCoverage
  class << self
    def wear!(setting = nil, &block) # rubocop:disable Metrics/MethodLength
      SimpleCov.start setting, &block
      if @generate_report
        if @running_ci
          require 'codeclimate-test-reporter'
          @output.puts '[COVERAGE] Running with SimpleCov Simple Formatter ' \
          'and CodeClimate Test Reporter'
          formatters = [
            SimpleCov::Formatter::SimpleFormatter,
            CodeClimate::TestReporter::Formatter
          ]
        else
          @output.puts '[COVERAGE] Running with SimpleCov HTML Formatter'
          formatters = [SimpleCov::Formatter::HTMLFormatter]
        end
      else
        formatters = []
      end
      SimpleCov.formatters = formatters
    end
  end
end