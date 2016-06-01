describe Unit do
  let(:footman) { described_class.new }

  describe "#attack!" do
    subject { footman.attack! victim }

    context "when attackacking a barracks" do
      let(:victim) { Barracks.new }

      it "deals half of its ap to the barracks" do
        expect{subject}.to change{victim.health}.
          from(victim.health).
          to(victim.health - 5)
      end
      it do
        current_health = victim.health
        subject
        expect(victim.health).to eql(current_health - 5)
      end

    end
    context "when attacking a unit" do
      let(:victim) { Footman.new }

      it "deals full damage to the other unit" do
        expect{subject}.to change{victim.health}.
          from(victim.health).
          to(victim.health - 10)
      end

    end
  end
end