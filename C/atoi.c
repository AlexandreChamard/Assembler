int my_atoi(char *str)
{
	int nb = 0;
	int neg = 1;

	if (*str == '-') {
		neg = -1;
		str++;
	}
	while (*str >= '0' && *str <= '9') {
		nb = nb * 10 + *str - '0';
		str++;
	}
	return (nb * neg);
}
