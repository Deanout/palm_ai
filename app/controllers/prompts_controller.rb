class PromptsController < ApplicationController
    # PalmService is a class that interacts with the Palm API
    include PalmService

    def create
        @input = params[:prompt]
        # @response = "Response: " + params[:prompt]
        @response = post_to_palm(params[:prompt])

        @prompt = Prompt.create(input: @input, response: @response)

        respond_to do |format|
            format.turbo_stream 
            format.html { redirect_to prompts_path, flash: { scroll_to_bottom: true } }
        end
    end
end
