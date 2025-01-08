# tvpi

This project sets up a slideshow using the `fbi` package to display images on the console. It includes scripts for user creation, package installation, firewall configuration, and health checks.

## Setup

1. Clone the repository.
2. Run the `main.sh` script to set up the environment.

```bash
bash main.sh
```

## Configuration

The configuration variables are defined in the `config.sh` file. You can modify them as needed.

## Scripts

- `create_user.sh`: Sets up directories.
- `install_packages.sh`: Installs the required packages.
- `config_firewall.sh`: Configures the firewall.
- `setup_slideshow.sh`: Sets up the slideshow script.
- `cron_health_check.sh`: Sets up a health check script and cron job.

## Systemd Service

A systemd service is created to run the slideshow script on reboot. The service is enabled and started automatically during setup.

To manually control the service, use the following commands:

```bash
sudo systemctl start slideshow.service
sudo systemctl stop slideshow.service
sudo systemctl restart slideshow.service
sudo systemctl status slideshow.service
```
