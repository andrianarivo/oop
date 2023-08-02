
describe "Hello World" do
  context "When testing 'Hello World' message" do
    it "Should just have the 'Hello World' message" do
      expect("Hello World").to eql "Hello World"
    end
  end
end
