# BAD
describe ReportPolicy do
  let(:user) { User.new(report_ids: [1, 2]) }
  let(:report) { Report.new(id: 2) }

  describe "#allowed?" do
    context "when user has access to report" do
      it "returns true" do
        policy = ReportPolicy.new(user, report)

        expect(policy).to be_allowed
      end
    end

    context "when user does not have access to report" do
      it "returns false" do
        report.id = 3
        policy = ReportPolicy.new(user, report)

        expect(policy).not_to be_allowed
      end
    end
  end
end

# GOOD
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
