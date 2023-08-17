# Arkserver on Agones

This repository contains all the required resources to run ARK server on Agones. ARKserver is gameserver for ARK: Survival Evolved.

## Default configuration

Default map = CrystalIsles
Default Admin Password = defaultpassword
Defualt no. Player = 70

## Env

ISLAND_NAME = TheIsland/CrystalIsles/Ragnarok
ADMIN_PASSWORD = "YourPassword"
PLAYER = 10

## Prerequisite

K8s cluster.
Agones installed
LoadBalancer IP

## Installation

```bash
kubectl apply -f ark-gameserver-updated.yaml
kubectl get gameserver
# wait for the server until it will be in ready condition
```

## Features

- Easily scalable
- You can switch accross multiple maps
- Easy Player management
- ARM64/AMD64

## Contributing

Contributions are always welcome!

## Author

- [@asabhi6776](https://www.github.com/asabhi6776)

## License

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
