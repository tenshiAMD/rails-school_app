RSpec.shared_examples 'other attributes not changed' do |attributes|
  it "should not change except #{attributes.join(',')}" do
    expect(subject).to_not satisfy do |a|
      (a.attributes.keys - attributes).any? { |b| a.send("#{b}_changed?") }
    end
  end
end
