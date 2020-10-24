# Not recommended
describe ReportPolicy do
  let(:report_id) { 2 }
  let(:report_policy) do
    ReportPolicy.new(
      User.new(report_ids: [1,2]),
      Report.new(id: report_id)
    )
  end

  describe "#allowed?" do
    subject { report_policy.allowed? }
    
    context "when user has access to report" do
      it { should be true }
    end

    context "when user does not have access to report" do
      let(:report_id) { 3 }
      
      it { should be false }
    end
  end
end

# Recommended
describe ReportPolicy do
  describe "#allowed?" do
    context "when user has access to report" do
      it "returns true" do
        policy = build_policy(report_id: 2, allowed_report_ids: [1, 2])

        expect(policy).to be_allowed
      end
    end

    context "when user does not have access to report" do
      it "returns false" do
        policy = build_policy(report_id: 3, allowed_report_ids: [1, 2])

        expect(policy).not_to be_allowed
      end
    end
  end

  def build_policy(report_id:, allowed_report_ids:)
    user = instance_double("User", report_ids: allowed_report_ids)
    report = instance_double("Report", id: report_id)

    ReportPolicy.new(user, report)
  end
end
