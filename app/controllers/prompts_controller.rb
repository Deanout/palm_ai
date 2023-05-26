class PromptsController < ApplicationController

    def create
        @input = "Input: " + params[:prompt]
        @response = "Response: " + params[:prompt]

        @prompt = Prompt.create(input: @input, response: @response)

        respond_to do |format|
            format.turbo_stream 
            format.html { redirect_to prompts_path, flash: { scroll_to_bottom: true } }
        end
    end
end
