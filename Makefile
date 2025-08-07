.PHONY: build deploy clean

default: deploy

build:
	hugo -d docs

deploy: build
	git add .
	git commit -m "🚀 auto deploy"
	git push

clean:
	rm -rf docs/
