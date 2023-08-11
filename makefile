docker:
	docker build --rm -t docker-sencha -f Dockerfile .
	docker run -it docker-sencha diag show-props

bash: docker
	docker run -it --entrypoint /bin/bash docker-sencha

clean:
	git reset --hard
	git pull
	git --no-pager log -1
