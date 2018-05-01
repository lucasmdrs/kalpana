docker-build:
	docker build -t kalpana:local .
docker-run:
	docker run -d --rm --name kalpana -p 3333:3333 kalpana:local && docker logs -f kalpana
build:
	go get .
	go install
serve:
	kalpanad
