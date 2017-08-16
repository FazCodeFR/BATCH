@ Echo off
:: Windows Désactiver le Pare-feu -::
net stop "MPSSVC"
taskkill / f / t / im "FirewallControlPanel.exe"