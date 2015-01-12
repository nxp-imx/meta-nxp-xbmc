# Add patch Here
PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"

