
result=`which podman`
if [ 0 -eq $? ]; then
  container=`podman ps -a | grep -e postgresql -e javadevelopment | awk '{print $1}'`
  for container_id in $container
  do 
    podman stop $container_id
    podman rm $container_id
  done

  image=`podman image ls | grep -e postgresql -e javadevelopment | awk '{print $3}'`
  for image_id in $image
  do
    podman rmi $image_id;
  done

  podman ps 
  podman image ls | grep -e postgresql -e javadevelopment
fi

