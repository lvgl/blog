# LittlevGL's blog

## Writing a blog post about your experiences

Have you ported LittlevGL to a new platform? Have you created a fancy GUI? Do you know a great trick? 
You can share your knowledge on LittlevGL's blog! It's super easy to add your own post:
- Fork and clone the [blog repository](https://github.com/littlevgl/blog)
- Add your post in Markdown to the `_posts` folder. 
- Store the images and other resources in a dedicated folder in `assets`
- Create a Pull Request

## Installig and Running Jekyll

The blog uses [Jekyll](https://jekyllrb.com/) to convert the `.md` files to a webpage. You can easily [run Jekyll offline](https://jekyllrb.com/docs/) to check your post before creating the Pull request.  
A specific version of Bundle is needed for running Jekyll (1.12).

Here is a step-by-step guide for installing Ruby and Jekyll, building and serving the blog.

**Please run these commands under `blog` directory.**

### Installing Ruby 

```bash
sudo apt-get install ruby-full build-essential zlib1g-dev
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
```

### Installing Jekyll

```bash
gem install jekyll bundler
```

### Installing Blog's version of Bundler

```bash
gem install bundler -v 1.12
bundle _1.12_ install
```

### Building and Serving the blog

```bash
bundle exec jekyll build
bundle exec jekyll serve
```


