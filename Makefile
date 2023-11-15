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

fclean :
	@$(SUDO) docker container prune -f
	@$(SUDO) docker image prune -a -f

.PHONY : build run fclean
