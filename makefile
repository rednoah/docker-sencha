docker:
	docker build --rm -t docker-sencha -f Dockerfile .
	docker run -it -v ${PWD}/example:/src docker-sencha app build production

clean:
	git reset --hard
	git pull
	git --no-pager log -1
