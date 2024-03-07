/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   load_text.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ttaquet <ttaquet@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/03/02 15:02:06 by tom               #+#    #+#             */
/*   Updated: 2024/03/07 15:59:38 by ttaquet          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "so_long.h"

void	load_text(t_env *env)
{
	t_coord		coord;
	t_texture	*tmp;

	tmp = NULL;
	tmp = malloc(sizeof(t_texture));
	coord.x = 1;
	coord.y = (env->map_height + 1);
	coord.z = 25;
	tmp->a = mlx_load_png("texture/text/move.png");
	tmp->b = mlx_load_png("texture/text/point.png");
	env->strmove_coord = coord;
	load_image(env->mlx, coord, mlx_texture_to_image(env->mlx, tmp->a) , true);
	coord.y++;
	env->strpoint_coord = coord;
	load_image(env->mlx, coord, mlx_texture_to_image(env->mlx, tmp->b) , true);
	ft_del_texture(tmp, 2);
	free(tmp);
}