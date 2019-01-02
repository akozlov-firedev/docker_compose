if ($dropscanContainerId = docker ps -a -q -f name=sd.dropscan.api.container-*) { 
  docker rm -f $dropscanContainerId 
}

if ($simpledmsApiContainerId = docker ps -a -q -f name=sd.simpledms.api.container-*) { 
  docker rm -f $simpledmsApiContainerId 
}

if ($simpledmsUiContainerId = docker ps -a -q -f name=sd.simpledms.ui.container-*) { 
  docker rm -f $simpledmsUiContainerId 
}

if ($simpledmsDbContainerId = docker ps -a -q -f name=simple.dms.db.container-*) { 
  docker rm -f $simpledmsDbContainerId 
}

. docker-compose up -d
EXIT 0
