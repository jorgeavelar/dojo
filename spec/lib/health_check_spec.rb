require 'rails_helper'

RSpec.describe HealthCheck do
  let(:instance) { described_class.new }

  before { Timecop.freeze(Time.local(2021, 4, 23, 15, 30, 0)) }
  after { Timecop.return }

  describe "#heart_beat" do
    it { expect(HealthCheck.heart_beat).to include(status: :ok) }
  end

  describe "#results" do
    context "when check all checkers and return results" do
      let(:results) do
        {
          entries: {
            sum: {
              status: "ok",
              elapsed_time: 0.0
            },
            div: {
              status: "error",
              message: "ZeroDivisionError - divided by 0",
              elapsed_time: 0.0
            }
          },
          elapsed_time: 0.0
        }
      end

      it { expect(instance.results).to include(results) }
    end
  end

  describe "#check" do
    context "when check a block and return status error" do
      it { expect(instance.check { 1/0 }).to include(status: "error", message: "ZeroDivisionError - divided by 0", elapsed_time: 0.0)  }
    end

    context "when check a block and return ok" do
      it { expect(instance.check { 1 + 1 }).to include(status: "ok", elapsed_time: 0.0)  }
      it { expect(instance.check { 5 / 2 }).to include(status: "ok", elapsed_time: 0.0)  }
    end
  end

  context "when check sum operation and return status ok" do
    it { expect(instance.sum).to include(status: "ok", elapsed_time: 0.0) }
  end

  context "when check div operation and return status error" do
    it { expect(instance.div).to include(status: "error", message: "ZeroDivisionError - divided by 0", elapsed_time: 0.0) }
  end
end
