require_relative "../components/vote_share"
require_relative "../components/vote_share_change"
require_relative "../components/overall_results"

class GeResults < SitePrism::Page
  set_url "/news/election/2015/results"

  section :vote_share, VoteShare, "#vote-share"

  section :vote_share_change, VoteShareChange, "#vote-share-change"

  section :overall_results, OverallResults, "#general_election_data-nation_results_en"
end
