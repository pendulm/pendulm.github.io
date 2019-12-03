docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/jekyll   jekyll build
docker run --rm -v $PWD/_site/:/usr/share/nginx/html:ro -p 8080:80  nginx

