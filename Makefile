.PHONY: up down logs status restart

up:
	podman-compose up -d

down:
	podman-compose down

logs:
ifeq ($(SERVICE),)
	podman-compose logs -f
else
	podman-compose logs -f $(SERVICE)
endif

status:
	podman-compose ps

restart:
	podman-compose down
	podman-compose up -d
