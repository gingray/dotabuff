RSpec.describe Dotabuff, vcr: true do
  let(:client) { Dotabuff::Client.new }

  describe '.fetch_heroes' do
    let(:heroes) { client.fetch_heroes }

    it "fetch heroes" do
      expect(heroes).to be_a Array
    end
  end

  describe '.fetch_pick', focus: true do
    let(:heroes) { client.fetch_heroes }
    it "fetch heroes" do
      heroes.each do |item|
        resp = client.fetch_pick(item[:pick_url])
        expect(resp).to be_a Hash
      end
    end
  end
end
