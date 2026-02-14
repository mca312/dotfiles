# Define directories and files
DOTFILES_DIR := ${PWD}

# Neovim
NVIM_SOURCE := $(DOTFILES_DIR)/nvim
NVIM_TARGET := $(HOME)/.config/

# Tmux
TMUX_CONF_SOURCE := $(DOTFILES_DIR)/tmux/.tmux.conf
TMUX_CONF_TARGET := $(HOME)/.tmux.conf
TMUX_CONF_LOCAL_SOURCE := $(DOTFILES_DIR)/tmux/.tmux.conf.local
TMUX_CONF_LOCAL_TARGET := $(HOME)/.tmux.conf.local
TMUXINATOR_TARGET := $(HOME)/.config/tmuxinator

# Zsh
ZSHRC_SOURCE := $(DOTFILES_DIR)/zsh/.zshrc
ZSHRC_TARGET := $(HOME)/.zshrc
ZSHENV_SOURCE := $(DOTFILES_DIR)/zsh/.zshenv
ZSHENV_TARGET := $(HOME)/.zshenv
ZPROFILE_SOURCE := $(DOTFILES_DIR)/zsh/.zprofile
ZPROFILE_TARGET := $(HOME)/.zprofile
P10K_SOURCE := $(DOTFILES_DIR)/zsh/.p10k.zsh
P10K_TARGET := $(HOME)/.p10k.zsh

.PHONY: all install clean nvim tmux zsh

all: install

install: nvim tmux zsh

# Neovim symlink
nvim:
	@echo "Creating symlink for Neovim configuration..."
	@mkdir -p $(HOME)/.config
	@ln -sf $(NVIM_SOURCE) $(NVIM_TARGET)
	@echo "Symlink created: $(NVIM_TARGET) -> $(NVIM_SOURCE)"

# Tmux symlink
tmux:
	@echo "Creating symlink for Tmux configuration..."
	@ln -sf $(TMUX_CONF_SOURCE) $(TMUX_CONF_TARGET)
	@if [ -f $(TMUX_CONF_LOCAL_SOURCE) ]; then ln -sf $(TMUX_CONF_LOCAL_SOURCE) $(TMUX_CONF_LOCAL_TARGET); fi
	@echo "Symlink created: $(TMUX_CONF_TARGET) -> $(TMUX_CONF_SOURCE)"
	@if [ -f $(TMUX_CONF_LOCAL_SOURCE) ]; then echo "Symlink created: $(TMUX_CONF_LOCAL_TARGET) -> $(TMUX_CONF_LOCAL_SOURCE)"; fi
	@ln -sf $(DOTFILES_DIR)/tmux/tmuxinator $(TMUXINATOR_TARGET)

# Zsh symlinks
zsh:
	@echo "Creating symlink for Zsh configuration..."
	@ln -sf $(ZSHRC_SOURCE) $(ZSHRC_TARGET)
	@if [ -f $(ZSHENV_SOURCE) ]; then ln -sf $(ZSHENV_SOURCE) $(ZSHENV_TARGET); fi
	@if [ -f $(ZPROFILE_SOURCE) ]; then ln -sf $(ZPROFILE_SOURCE) $(ZPROFILE_TARGET); fi
	@if [ -f $(P10K_SOURCE) ]; then ln -sf $(P10K_SOURCE) $(P10K_TARGET); fi
	@echo "Symlinks created for Zsh configuration."

# Clean up symlinks
clean: clean-nvim clean-tmux clean-zsh

clean-nvim:
	@rm -f $(NVIM_TARGET)

clean-tmux:
	@rm -f $(TMUX_CONF_TARGET)
	@rm -f $(TMUX_CONF_LOCAL_TARGET)

clean-zsh:
	@rm -f $(ZSHRC_TARGET)
	@rm -f $(ZSHENV_TARGET)
	@rm -f $(ZPROFILE_TARGET)
	@rm -f $(P10K_TARGET)
