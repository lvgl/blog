---
permalink: last_posts
layout: empty
---

{% for post in site.posts limit:4 %}
<div class="row intro-card">
    <div class="col-md-2 col-md-offset-1">
         {% if post.cover %}
           <img class="img-responsive" src="https://blog.littlevgl.com{{ post.cover}}">
         {% else %}
           <img class="img-responsive" src="https://blog.littlevgl.com{{ site.cover}}">
         {% endif %}
    </div>
    
    <div class='col-md-8'>
        <h3 class='feature-title' style='margin-bottom:10px'> {{ post.title }} </h3>
        <p style='margin-bottom:20px'> {{ post.content | strip_html | truncatewords: 30 }} </p>
        <a href="https://blog.littlevgl.com{{ post.url}}"  role='button' class='post-btn'>Read post</a>
    </div>
</div>
          
{% endfor %}
