module PagesHelper
    def markdown(content)
       tag.airticle data: { controller: "markdown-viewer"} do
        content
       end
        

    #     <div data-controller="markdown-viewer">
    # <p><%= @resume.context %></p>
    # </div>

    end
    

end