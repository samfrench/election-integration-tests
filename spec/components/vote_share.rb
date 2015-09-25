class VoteShareSection < SitePrism::Section
end

class VoteShareResults < VoteShareSection
  section :vote_share, VoteShareSection, "#vote-share"

  element :party, ".vote-share__results-party"
  element :votes, ".vote-share__results-vote-share-value"
end

class VoteShare < VoteShareResults
  sections :vote_share_results, VoteShareResults, ".vote-share__results-result"

  def vote_share_total
    results_total = 0

    vote_share_results.each do |result|
      results_total += result.votes.text.to_f
    end

    results_total
  end

  def parties
    parties = []

    vote_share_results.each do |result|
        parties << result.party.text
    end

    parties.sort
  end
end
