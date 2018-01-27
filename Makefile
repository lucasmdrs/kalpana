build:
	go get -d ./...
	go install ./cmd/kalpanad
serve: 
	kalpanad