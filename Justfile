rebuild:
  home-manager switch --flake .
reload-vscode:
  systemctl --user restart auto-fix-vscode-server.service
