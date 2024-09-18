NAME 	= minishell

# Directories
SRCDIR  = Srcs
LIBFTDIR= libft
INCDIR  = Srcs/Includes

# Source files
SRCS    = $(SRCDIR)/main.c $(SRCDIR)/Prompt/prompt.c $(SRCDIR)/Parsing/dollars_utils.c $(SRCDIR)/Parsing/lexer.c $(SRCDIR)/Parsing/quotes_utils.c \
				$(SRCDIR)/Parsing/replace_dollar.c $(SRCDIR)/Parsing/token_list_utils.c $(SRCDIR)/Parsing/create_token_list.c \
				$(SRCDIR)/Parsing/cmd_list_param.c $(SRCDIR)/Parsing/cmd_list_utils.c $(SRCDIR)/Parsing/create_cmd_list.c \
				$(SRCDIR)/Parsing/fd_utils.c $(SRCDIR)/Parsing/here_doc.c $(SRCDIR)/Utils/free_cmd.c $(SRCDIR)/Utils/data_utils.c \
				$(SRCDIR)/Utils/free.c
				
OBJS    = $(SRCS:.c=.o)

# Compiler and flags
CC      = gcc
CFLAGS  = -Wall -Wextra -Werror -I$(INCDIR)

# Libraries
LIBFT   = $(LIBFTDIR)/libft.a
LIBS    = -L$(LIBFTDIR) -lft -lreadline

# Colors
YELLOW  = \033[33m
GREEN   = \033[32m
RED     = \033[31m
RESET   = \033[0m

%.o: %.c
	@$(CC) $(CFLAGS) -g -c $< -o $@
	
all: $(NAME)


$(NAME): $(OBJS)
	@echo "$(YELLOW)----Compiling minishell----$(RESET)"
	@make re -C ./libft
	@$(CC) $(OBJS) $(LIBS) -o $(NAME)
	@echo "$(GREEN)Minishell Compiled! ᕦ($(RED)♥$(GREEN)_$(RED)♥$(GREEN))ᕤ$(RESET)\n"

clean:
	@make clean -C ./libft
	@rm -f $(OBJS)

fclean: clean
	@make fclean -C ./libft
	@rm -f $(NAME)
	@echo "\n\033[31mDeleting EVERYTHING! ⌐(ಠ۾ಠ)¬\n"

re: fclean all

.PHONY: all clean fclean re