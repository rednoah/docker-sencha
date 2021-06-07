docker:
	docker build --rm -t docker-sencha -f Dockerfile .
	docker run -it -v ${PWD}/example:/src -p 1841:1841 docker-sencha app watch

clean:
	git reset --hard
	git pull
	git --no-pager log -1
