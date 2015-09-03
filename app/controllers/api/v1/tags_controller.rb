module Api
  module V1
    class TagsController < ApiController
      def search
        tags = ActsAsTaggableOn::Tag.where("LOWER(tags.name) ILIKE ?", "%#{params[:search]}%")
                                    .order("name ASC")
                                    .most_used(5)

        render json: tags.map { |t| {id: t.name, text: t.name} }
      end
    end
  end
end
