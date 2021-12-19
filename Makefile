jupyter-start:
	@docker run \
		--detach \
		--env JUPYTER_ENABLE_LAB=yes \
		--name jupyter \
		--publish 8888:8888 \
		--volume $(PWD)/data:/home/jovyan/data \
		--volume $(PWD)/notebooks:/home/jovyan/notebooks \
		jupyter/scipy-notebook:latest
	@sleep 3
	@make -s jupyter-token

jupyter-token:
	@docker exec -it jupyter jupyter server list

jupyter-stop:
	@docker stop jupyter
	@docker rm jupyter

browser-start:
	@python3 -m http.server 8000
