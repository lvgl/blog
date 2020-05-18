---
permalink: last_posts
layout: empty
---

{% for post in site.posts limit:4 %}
  <div class="item">
    <div class="single-product rounded white-bg productborder">
      {% if post.cover %}
         <img src="https://blog.littlevgl.com{{ post.cover}}" class="img-fluid p-4" alt="product" />
      {% else %} 
        <img src="https://blog.littlevgl.com{{ site.cover}}" class="img-fluid p-4" alt="product" />
      {% endif %}
      <div class="product-info text-center pb-4 px-3">
      <h4 class="mb-1">{{ post.title }}</h4>
      <div class="threedotsthree">{{ post.content | strip_html | truncatewords: 30 }}</div>
      <a href="https://blog.lvgl.io{{ post.url}}" class="btn secondary-btn" style="margin-top:20px">Read more</a>
    </div>
  </div>
{% endfor %}
