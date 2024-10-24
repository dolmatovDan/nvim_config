vim.keymap.set(
	"n",
	"<S-F7>",
	":w <CR> :!g++ -std=c++20 -Wall -Wextra -Wshadow -DLOCAL -O2 % -o %< <CR>"
)
