require "spec_helper"
require_relative "pages/ge_results"

describe "GeResults" do
  let (:ge_results_page) { GeResults.new }

  before do
    ge_results_page.load
  end

  context "GeResults" do
    describe "vote share" do
      it "should total 100" do
        expect(ge_results_page.vote_share.vote_share_total).to eq(100)
      end
    end

    describe "vote share and vote share change" do
      it "should contain the same parties" do
        expect(ge_results_page.vote_share.parties).to eq(ge_results_page.vote_share_change.parties)
      end
    end

    describe "overall results" do
      it "sorted by vote share should match vote share component" do
        ge_results_page.overall_results.voteshare.click

        ge_results_page.overall_results.wait_for_animation_complete

        expect(ge_results_page.overall_results.top_six_parties).to eq(ge_results_page.vote_share.parties)
      end
    end
  end
end
