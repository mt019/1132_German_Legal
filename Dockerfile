FROM squidfunk/mkdocs-material:latest
RUN pip install --no-cache-dir mkdocs-exclude
RUN pip install --no-cache-dir mkdocs-awesome-pages-plugin