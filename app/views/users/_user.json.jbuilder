json.extract! user, :id, :first_name, :last_name, :email
json.skill_list FiltersHelper.parse_for_params(user.skill_list)
json.role_list FiltersHelper.parse_for_params(user.role_list)
