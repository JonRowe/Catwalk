shared_examples_for "proxy active_model method" do |method,opts|
	let(:target) { send opts[:from] }
	let(:target_value) { double "value" }

	before do
		allow(target).to receive(method) { target_value }
	end

	it "should proxy #{method} to #{opts[:from]}" do
		expect(target).to receive(method) { target_value }
		subject.send(method)
	end

	it "#{method} should == #{opts[:from]}.value" do
		expect(subject.send(method)).to eq target_value
	end
end
