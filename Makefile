# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aduenas- <aduenas-@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/23 09:24:00 by aduenas-          #+#    #+#              #
#    Updated: 2023/08/24 16:03:50 by aduenas-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
INCLUDE = .
LIBFT = libft
CC = gcc
CFLAGS = -Wall -Werror -Wextra -I$(INCLUDE) -I$(LIBFT)

SRCS = 	ft_printf.c \
		ft_print.c \
		ft_print_hex.c \
		ft_print_ptr.c \
		ft_print_u.c	

OBJS = $(SRCS:.c=.o)
HDR_FILES = ft_printf.h libft/libft.h

all: $(NAME)

$(NAME): $(OBJS) $(HDR_FILES) Makefile
	@$(MAKE) -C $(LIBFT)
	@cp $(LIBFT)/libft.a $(NAME)
	@ar -r $(NAME) $(OBJS)

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -f $(OBJS)
	@cd $(LIBFT) && make clean
	
fclean: clean
	@rm -f $(NAME)
	@cd $(LIBFT) && make fclean
	
re: fclean all

.PHONY: all, clean, clean, re

