json.extract! project, :id, :name, :description, :image, :category, :status, :user_id
json.favorites project.users_have_marked_as_favorite.size
json.current_user_favorite project.marked_as_favorite? by: current_user