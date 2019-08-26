RSpec.describe Dotabuff, focus: true do
  let(:client) { Dotabuff::Client.new }
  let(:heroes) { client.fetch }

  it "has a version number" do
    binding.pry
    expect(heroes).to eq ''
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
