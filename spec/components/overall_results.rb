class OverallResultsSection < SitePrism::Section
end

class OverallResultsResults < OverallResultsSection
  section :overall_results, OverallResultsSection, "#general_election_data-nation_results_en"

  element :party, ".ge2015-background__party"
  element :vote_share, ".party__result--votesshare"
end

class OverallResults < OverallResultsResults
  element :voteshare, "li[data-sort=votesshare]"

  element :animation_complete, ".party[style='transform: translateY(0px);']"

  sections :overall_results_results, OverallResultsResults, ".party"

  def top_six_parties
    parties = []

    overall_results_results.take(6).each do |party|
      parties << party.party[:class].split("--").last.upcase
    end

    parties.sort
  end
end
