# spec/support/active_model_lint.rb
# adapted from rspec-rails: http://github.com/rspec/rspec-rails/blob/master/spec/rspec/rails/mocks/mock_model_spec.rb

shared_examples_for "ActiveModel" do

  it { expect(presenter).to respond_to :to_key }
  it { expect(presenter).to respond_to :to_param }
  it { expect(presenter).to respond_to :valid? }
  it { expect(presenter).to respond_to :persisted? }
  it { expect(presenter).to respond_to :model_name }
  it { expect(presenter).to respond_to :errors }
  it { expect(presenter).to respond_to :to_model }

  it "has a model_name" do
    expect(presenter.model_name).to be_a String
  end
  it "has a model_name.human" do
    expect(presenter.model_name.human).to be_a String
  end
  it "has a model_name.partial_path" do
    expect(presenter.model_name.partial_path).to be_a String
  end
  it "has a model_name.singular" do
    expect(presenter.model_name.singular).to be_a String
  end
  it "has a model_name.plural" do
    expect(presenter.model_name.plural).to be_a String
  end

  it "has errors.full_messages" do
    expect(presenter.errors.full_messages).to be_a Array
  end

  it "has blank arrays for keys" do
    expect(presenter.errors[:hello]).to eq []
  end

  context "where not persisted" do
    before do
      allow(presenter).to receive(:persisted?) { false }
    end

    it "has a nil to_key" do
      expect(presenter.to_key).to eq nil
    end

    it "has a nil to_param" do
      expect(presenter.to_param).to eq nil
    end

  end
end
