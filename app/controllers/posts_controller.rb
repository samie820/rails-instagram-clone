class PostsController < ApplicationController
    def create
        Post.create(post_params)
        
        redirect_to root_path
    end

    private def post_params
        params.require(:post).permit(:description, :image, :user_id)
    end

    validates :image_presence

    def image_presence
        errors.add(:image, "Cannot be blank") unless image.attached?
    end

end
