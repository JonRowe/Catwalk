shared_examples_for "proxy active_model method" do |method,opts|
	let(:target) { send opts[:from] }
	let(:target_value) { mock "value" }

	before do
		target.stub(method).and_return(target_value)
	end

	it "should proxy #{method} to #{opts[:from]}" do
		target.should_receive(method).and_return(target_value)
		subject.send(method)
	end

	it "#{method} should == #{opts[:from]}.value" do
		subject.send(method).should == target_value
	end
end
