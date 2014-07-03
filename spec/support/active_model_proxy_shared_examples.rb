shared_examples_for "proxy active_model method" do |method,opts|
	let(:target) { send opts[:from] }
	let(:target_value) { double "value" }

	before do
		allow(target).to receive(method) { target_value }
	end

	it "proxies #{method} to #{opts[:from]}" do
		expect(target).to receive(method) { target_value }
		presenter.send(method)
	end

	it "#{method} eq #{opts[:from]}.value" do
		expect(presenter.send(method)).to eq target_value
	end
end
