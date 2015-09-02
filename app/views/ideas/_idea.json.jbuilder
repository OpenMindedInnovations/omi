json.extract! idea, :id, :name, :description, :user_id
json.upvotes idea.votes_for.up.size
json.current_user_upvote current_user.voted_up_on? idea
