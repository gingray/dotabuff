RSpec.describe Dotabuff, focus: true do
  let(:client) { Dotabuff::Client.new }
  let(:heroes) { client.fetch_heroes }

  it "fetch heroes" do
    expect(heroes).to be_a Array
  end
end
