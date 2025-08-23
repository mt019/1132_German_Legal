FROM squidfunk/mkdocs-material:latest
RUN pip install --no-cache-dir mkdocs-exclude
RUN pip install --no-cache-dir mkdocs-awesome-pages-plugin
# Dockerfile（在你現有的基礎上加一行）
FROM squidfunk/mkdocs-material:latest
RUN pip install --no-cache-dir \
    mkdocs-awesome-pages-plugin \
    mkdocs-exclude \
    mkdocs-minify-plugin \
    mkdocs-git-revision-date-localized-plugin \
    mdx_truly_sane_lists