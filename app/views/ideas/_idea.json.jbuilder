json.extract! idea, :id, :name, :description, :user_id
json.votes idea.votes_for.size
json.current_user_vote current_user.voted_up_on? idea
