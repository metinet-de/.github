---
layout: page
title: Blog
description: "Insights on AI, Software Development, and Technology"
permalink: /blog/
lang: en
ref: blog
---

{%- assign current_lang = page.lang | default: "en" -%}
{%- assign t = site.data.i18n[current_lang] -%}

<div class="blog-intro">
  <p>{{ t.blog.intro }}</p>
</div>

<div class="blog-posts">
  {%- assign lang_posts = site.posts | where: "lang", current_lang -%}
  {%- if lang_posts.size > 0 -%}
    {%- for post in lang_posts -%}
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
              <a href="{{ "/blog/tags/" | relative_url }}#{{ tag | slugify }}" class="tag">#{{ tag }}</a>
            {%- endfor -%}
          </div>
        {%- endif -%}
        
        <footer class="post-preview-footer">
          <a href="{{ post.url | relative_url }}" class="read-more">{{ t.blog.read_more }}</a>
        </footer>
      </article>
    {%- endfor -%}
  {%- else -%}
    <p class="no-posts">{{ t.blog.no_posts }}</p>
  {%- endif -%}
</div>

<div class="blog-sidebar">
  <section class="categories">
    <h3>{{ t.blog.categories }}</h3>
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
    <h3>{{ t.blog.tags }}</h3>
    <div class="tag-cloud">
      {%- assign tags = site.tags | sort -%}
      {%- for tag in tags -%}
        {%- assign tag_en_posts = tag[1] | where: "lang", current_lang -%}
        {%- if tag_en_posts.size > 0 -%}
          <a href="{{ "/blog/tags/" | relative_url }}#{{ tag[0] | slugify }}" class="tag">#{{ tag[0] }}</a>
        {%- endif -%}
      {%- endfor -%}
    </div>
  </section>
  
  <section class="rss">
    <h3>{{ t.blog.subscribe }}</h3>
    <p>
      <a href="{{ "/feed-en.xml" | relative_url }}">
        <svg class="svg-icon orange"><use xlink:href="#rss"></use></svg>
        RSS Feed (English)
      </a>
    </p>
    <p>
      <a href="{{ "/feed-de.xml" | relative_url }}">
        <svg class="svg-icon orange"><use xlink:href="#rss"></use></svg>
        RSS Feed (Deutsch)
      </a>
    </p>
  </section>
</div>