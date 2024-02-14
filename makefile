NAME = so_long

MAKEFLAGS += -s

LIBMLX = lib/libmlx42.a
LIBAMOA = lib/libamoa.a

CC = cc

CFLAGS = -Wall -Wextra -Werror -g -Iinclude

LFLAGS = -Llib \
			-lmlx42 -lamoa -ldl -lglfw -lXext -lX11 -lm

FILES = main parsing map_test ft_init

OBJ_DIR = obj/
SRC_DIR = src/
SRCS = $(addprefix $(SRC_DIR), $(addsuffix .c, $(FILES)))
OBJS = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(FILES)))

.PHONY: all clean fclean re

all: $(NAME)

clean:
	@echo "\033[32m✔ Suppression des fichiers sources...\033[37m"
	rm -rf $(OBJ_DIR)
	@echo "\033[32m✔ Suppression effectuer...\033[37m"

fclean: clean
	@echo "\033[32m✔ Suppression de l'éxécutable...\033[37m"
	rm -rf $(NAME)
	@echo "\033[32m✔ Suppression effectuer...\033[37m"

re: fclean all

$(NAME): $(OBJ_DIR) $(OBJS) $(LIBMLX) $(LIBAMOA)
	@echo "\033[32m✔ Compilation des fichiers sources...\033[37m"
	$(CC) -o $@ $(OBJS) $(LFLAGS)
	@echo "\033[32m✔ executable crée...\033[37m"

$(OBJ_DIR):
	@echo "\033[32m✔ création du repertoire src...\033[37m"
	mkdir $@
	@echo "\033[32m✔ repertoire src crée...\033[37m"

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	$(CC) $(CFLAGS) -c $< -o $@