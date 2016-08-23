RSpec.shared_examples 'http response not nil' do
  it { expect(subject).to_not be_nil }
end

[:success, :created, :ok, :no_content, :not_found].each do |status|
  RSpec.shared_examples "#{status} http response status" do
    it { expect(response).to have_http_status(status) }
    it_should_behave_like('http response not nil') unless [:not_found].include?(status)
  end
end
