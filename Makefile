PROJDIR		=	$(realpath $(CURDIR))
SRCS		=	$(CURDIR)/srcs

SUDO		=	/usr/bin/sudo

all :

build :
	@cd $(SRCS) && $(SUDO) docker compose build

run :
	@cd $(SRCS) && $(SUDO) docker compose up -d

stop :
	@$(SUDO) docker stop nginx
	@$(SUDO) docker stop portainer

fclean :
	@cd $(SRCS) && $(SUDO) docker compose down -v
	@$(SUDO) docker system prune -f

.PHONY : build run fclean
