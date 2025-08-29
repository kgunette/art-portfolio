---
layout: default
---

<section class="about-section">
    <div class="about-content">
        <div class="about-header">
            <h1>about</h1>
        </div>
        <div class="about-text">
            <p>Karen Schoellkopf is a multi-disciplinary artist. She has an MFA from the School of Visual Arts, a decade of experience in the art world, and another decade of experience working in the tech industry. Schoellkopf has been exhibiting artwork in the US and abroad since 1998. She began to cross-pollinate her work with technology in 2009. In collaboration with the Times Square Alliance, she exhibited an open source mapping project, "The Seven Deadly Sins of New York." Her art rigor and critical practice has dipped over into tech advocacy by creating <strong>Hire More Women In Tech</strong> in 2014, and co-launching <strong>realnames.online</strong> in late 2016. She also sang with a Ukrainian folk choir for 3 years, but listen, not everything in life is linear.</p>
        </div>
    </div>
</section>

## projects

<div class="projects-container">
{% assign sorted_projects = site.data.projects | sort: 'sort_year' | reverse %}

{% for project in sorted_projects %}
  {% assign index = forloop.index0 %}
  {% assign group_position = index | modulo: 6 %}
  
  {% comment %} Pattern 1: Large left, 2 small right {% endcomment %}
  {% if group_position == 0 %}
    <div class="project-row">
      <div class="project-large">
        <div class="project-card">
          <a href="{{ '/projects/' | append: project.id | append: '/' | relative_url }}" class="project-link">
            <div class="project-image">
              <img src="{{ '/assets/images/' | append: project.thumbnail | relative_url }}" alt="{{ project.title }}">
              <div class="project-overlay">
                <h3>{{ project.title }}</h3>
              </div>
            </div>
          </a>
        </div>
      </div>
      <div class="project-small-stack">
  {% elsif group_position == 1 or group_position == 2 %}
        <div class="project-card">
          <a href="{{ '/projects/' | append: project.id | append: '/' | relative_url }}" class="project-link">
            <div class="project-image">
              <img src="{{ '/assets/images/' | append: project.thumbnail | relative_url }}" alt="{{ project.title }}">
              <div class="project-overlay">
                <h3>{{ project.title }}</h3>
              </div>
            </div>
          </a>
        </div>
  {% endif %}
  
  {% comment %} Close first pattern and start second {% endcomment %}
  {% if group_position == 2 %}
      </div>
    </div>
    
    {% comment %} Pattern 2: 2 small left, large right {% endcomment %}
    <div class="project-row">
      <div class="project-small-stack">
  {% elsif group_position == 3 or group_position == 4 %}
        <div class="project-card">
          <a href="{{ '/projects/' | append: project.id | append: '/' | relative_url }}" class="project-link">
            <div class="project-image">
              <img src="{{ '/assets/images/' | append: project.thumbnail | relative_url }}" alt="{{ project.title }}">
              <div class="project-overlay">
                <h3>{{ project.title }}</h3>
              </div>
            </div>
          </a>
        </div>
  {% elsif group_position == 5 %}
      </div>
      <div class="project-large">
        <div class="project-card">
          <a href="{{ '/projects/' | append: project.id | append: '/' | relative_url }}" class="project-link">
            <div class="project-image">
              <img src="{{ '/assets/images/' | append: project.thumbnail | relative_url }}" alt="{{ project.title }}">
              <div class="project-overlay">
                <h3>{{ project.title }}</h3>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  {% endif %}
  
  {% comment %} Handle incomplete groups at the end {% endcomment %}
  {% if forloop.last %}
    {% if group_position == 0 %}
      </div></div>
    {% elsif group_position == 1 or group_position == 2 %}
      </div></div>
    {% elsif group_position == 3 or group_position == 4 %}
      </div></div>
    {% endif %}
  {% endif %}
{% endfor %}
</div>