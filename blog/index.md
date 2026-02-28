---
layout: page
title: Blog
description: "Insights on AI, Software Development, and Technology"
permalink: /blog/
---

<div class="blog-intro">
  <p>Welcome to my blog! Here I share insights from the world of software development, 
  artificial intelligence and innovative technologies. From practical tutorials to 
  technical deep-dives — everything around modern development.</p>
</div>

<div class="blog-posts">
  {%- if site.posts.size > 0 -%}
    {%- for post in site.posts -%}
      <article class="post-preview">
        <header class="post-preview-header">
          <h2 class="post-preview-title">
            <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
          </h2>
          <p class="post-preview-meta">
            <time datetime="{{ post.date | date_to_xmlschema }}">
              {{ post.date | date: "%B %-d, %Y" }}
            </time>
            {%- if post.categories.size > 0 -%}
              • 
              {%- for category in post.categories -%}
                <span class="post-category">{{ category }}</span>
                {%- unless forloop.last -%}, {%- endunless -%}
              {%- endfor -%}
            {%- endif -%}
          </p>
        </header>
        
        <div class="post-preview-content">
          {%- if post.description -%}
            <p>{{ post.description }}</p>
          {%- else -%}
            <p>{{ post.excerpt | strip_html | truncate: 200 }}</p>
          {%- endif -%}
        </div>
        
        {%- if post.tags.size > 0 -%}
          <div class="post-preview-tags">
            {%- for tag in post.tags -%}
              <span class="tag">#{{ tag }}</span>
            {%- endfor -%}
          </div>
        {%- endif -%}
        
        <footer class="post-preview-footer">
          <a href="{{ post.url | relative_url }}" class="read-more">Weiterlesen →</a>
        </footer>
      </article>
    {%- endfor -%}
  {%- else -%}
    <p class="no-posts">Keine Blog-Posts gefunden.</p>
  {%- endif -%}
</div>

<div class="blog-sidebar">
  <section class="categories">
    <h3>Kategorien</h3>
    <ul>
      {%- assign categories = site.categories | sort -%}
      {%- for category in categories -%}
        <li>
          <a href="#{{ category[0] | slugify }}">{{ category[0] }}</a>
          <span class="count">({{ category[1].size }})</span>
        </li>
      {%- endfor -%}
    </ul>
  </section>
  
  <section class="tags">
    <h3>Tags</h3>
    <div class="tag-cloud">
      {%- assign tags = site.tags | sort -%}
      {%- for tag in tags -%}
        <span class="tag">#{{ tag[0] }}</span>
      {%- endfor -%}
    </div>
  </section>
  
  <section class="rss">
    <h3>Abonnieren</h3>
    <p>
      <a href="{{ "/feed.xml" | relative_url }}">
        <svg class="svg-icon orange"><use xlink:href="#rss"></use></svg>
        RSS Feed
      </a>
    </p>
  </section>
</div>