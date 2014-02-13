RSpec::Matchers.define :be_named do |expected|
  match do |actual|
    expect(actual.full_name).to eq expected
  end

  failure_message_for_should do |actual|
    "expected to be named #{expected}"
  end

  failure_message_for_should_not do |actual|
    "expected not to be named #{expected}"
  end

  description do
    "returns user's full name"
  end
end