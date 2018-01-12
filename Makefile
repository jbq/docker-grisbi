all:
	docker build -t jbquenot/grisbi .
	docker push jbquenot/grisbi
