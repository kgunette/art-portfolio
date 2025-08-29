Jekyll::Hooks.register :site, :post_init do |site|
  site.data['projects'].each do |project|
    site.pages << Jekyll::Page.new(site, site.source, "projects", "#{project['id']}.html").tap do |page|
      page.data['layout'] = 'project'
      page.data['project_id'] = project['id']
      page.data['title'] = project['title']
    end
  end
end