class VoteShareChangeSection < SitePrism::Section
end

class VoteShareChangeResults < VoteShareChangeSection
  section :vote_share_change, VoteShareChangeSection, "#vote-share-change"

  element :party, ".vote-share-change__party-name"
  element :votes, ".vote-share-change__change"
end

class VoteShareChange < VoteShareChangeResults
  sections :vote_share_change_results, VoteShareChangeResults, ".vote-share-change__party"

  def parties
    parties = []

    vote_share_change_results.each do |result|
        parties << result.party.text
    end

    parties.sort
  end
end
