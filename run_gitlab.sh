docker run --detach \
  --hostname gitlab.testlab \
  --publish 8443:443 \
  --publish 8080:80 \
  --publish 8822:8822 \
  --name gitlab_testlab \
  --restart always \
  --volume $GITLAB_HOME/runner/1/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  -e GITLAB_OMNIBUS_CONFIG="gitlab_rails['gitlab_shell_ssh_port'] = 8822" \
  gitlab/gitlab-ce:latest
